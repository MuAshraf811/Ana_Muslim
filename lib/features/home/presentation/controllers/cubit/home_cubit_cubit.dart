import 'dart:convert';
import 'dart:math';
import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/utils/functions.dart';
import 'package:ana_muslim/core/widgets/snack_bar.dart';
import 'package:ana_muslim/features/home/data/hadith.dart';
import 'package:ana_muslim/features/home/data/radio.dart';
import 'package:ana_muslim/features/home/models/asmaa_allah_model.dart';
import 'package:ana_muslim/features/home/models/azkar_model.dart';
import 'package:ana_muslim/features/home/models/doaa_model.dart';
import 'package:ana_muslim/features/home/models/hadith_books_model.dart';
import 'package:ana_muslim/features/home/models/nawawy_model.dart';
import 'package:ana_muslim/features/home/models/prey_times_model2.dart';
import 'package:ana_muslim/features/home/models/radio_model.dart';
import 'package:ana_muslim/features/home/models/salah_model.dart';
import 'package:ana_muslim/features/home/models/surah_model.dart';
import 'package:ana_muslim/features/qiblah/data/surah_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../../../data/pray_time.dart';
part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  late List<SurahModel> allSurahs;
  late List<AzkarModel> azkrMOdel;
  List<InnerAzkar>? someZekr;
  String? someZekrCategoryName;

  DoaaModel? somedoaa;
  AsmaaAllahModel? someName;

  late List<PreyTimesModelTwo> allPreyTimes;
  late PreyTimesModelTwo preyTimeAtSomeDay;
  late List<HadithModel> hadith;
  late List<RadioModel> radioChannels;
  late String randomZekeText;
  late List<HadithBooksModel> hadithBooks;
  late List<AsmaaAllahModel> asmaaAllah;
  late List<DoaaModel> doaa;
  late List<NawawyModel> nawawy;

  List<SalahModel> salahZekr = [];
  int from = 1;
  int to = 15;
  bool isLoading = false;
  bool isListCollapsedInPreyZekr = true;
  HomeCubitCubit() : super(HomeCubitInitial());
  final ScrollController scrollController = ScrollController();

  generateCustomAllahName() async {
    try {
      emit(RandomAsmState());
      if (someName != null) {}
      final res = await rootBundle.loadString("assets/jsons/asmaa_allah.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
      final Map<String, dynamic> spacificList = response[random];
      someName = AsmaaAllahModel.fromJson(spacificList);

      emit(RandomAsmSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(RandomAsmErrorState(error: e.toString()));
    }
  }

  generateCustomDoaa() async {
    try {
      emit(RandomDoaaState());
      if (somedoaa != null) {}
      final res = await rootBundle.loadString("assets/jsons/doaa.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
      final Map<String, dynamic> spacificList = response[random];
      somedoaa = DoaaModel.fromJson(spacificList);

      emit(RandomDoaaSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(RandomDoaaErrorState(error: e.toString()));
    }
  }

  void getNaway() async {
    try {
      emit(NawawyLoadingState());

      final data = await rootBundle.loadString("assets/jsons/hadith_40.json");

      final List<dynamic> res = jsonDecode(data);

      nawawy = res
          .map(
            (e) => NawawyModel.fromJson(e),
          )
          .toList();

      emit(NawawyLoadedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getDoaa() async {
    try {
      emit(DoaaLoadingState());

      final data = await rootBundle.loadString("assets/jsons/doaa.json");

      final List<dynamic> res = jsonDecode(data);

      doaa = res
          .map(
            (e) => DoaaModel.fromJson(e),
          )
          .toList();

      emit(DoaaLoadedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getAsmaaAllah() async {
    try {
      emit(AsmaaAllahLoadingState());
      final data = await rootBundle.loadString("assets/jsons/asmaa_allah.json");
      final List<dynamic> res = jsonDecode(data);
      asmaaAllah = res
          .map(
            (e) => AsmaaAllahModel.fromJson(e),
          )
          .toList();
      emit(AsmaaAllahLoadedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void resturnPreyTimeAtSpacificDay() {
    preyTimeAtSomeDay = allPreyTimes.where(
      (element) => element.date == getCurrentDate(),
    ) as PreyTimesModelTwo;
  }

  void getSallahZeker() async {
    try {
      emit(LoadingListCollapsedState());
      final data = await rootBundle.loadString("assets/jsons/azkar_salah.json");
      final List<dynamic> res = jsonDecode(data);
      salahZekr = res
          .map(
            (e) => SalahModel.fromJson(e),
          )
          .toList();
      emit(ListCollapsedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getAllPreyTime() async {
    try {
      emit(FetchingPreyTimeState());
      // final myLocation = await LocationHandler.getuserCurrentLocation();
      final result = await PrayTimesCall.getMonthPreyTimesByDateAndLocation(
          city: "cairo", country: "egypt");
      allPreyTimes = result
          .map(
            (e) => PreyTimesModelTwo.fromjson(e),
          )
          .toList();
      emit(FetchingPreyTimeSuccessState());
    } catch (e) {
      emit(FetchingPreyTimeErrorState(error: e.toString()));
    }
  }

  shareText() async {
    try {
      emit(ShareRandomZekrState());
      await Share.share(randomZekeText, subject: "share");
      emit(ShareRandomZekrSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  copyText(BuildContext context) {
    Clipboard.setData(ClipboardData(text: randomZekeText)).then(
      (_) {
        showCustomSnackBar(context, "تم نسخ النص بنجاح", AppColors.offRed);
      },
    );
  }

  void generateCustomZekr() async {
    emit(RandomZekrState());
    try {
      emit(RandomZekrState());
      if (someZekr != null) {
        someZekr!.clear();
      }
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
      someZekrCategoryName = response[random]["category"];
      final List<dynamic> spacificList = response[random]['array'];
      someZekr = spacificList
          .map(
            (e) => InnerAzkar.fromJson(e),
          )
          .toList();
      randomZekeText = someZekr![someZekr!.length - 1].text;
      emit(RandomZekrSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(RandomZekrErrorState(error: e.toString()));
    }
  }

  void handleRadio() async {
    try {
      emit(GettingRadioState());
      final res = await RadioManager.getallRadioChannel();
      radioChannels = res
          .map(
            (e) => RadioModel.fromJson(e),
          )
          .toList();
      emit(RadioSuccessState());
    } catch (e) {
      emit(RadioErrorState(error: e.toString()));
    }
  }

  void watchHadithPagination(String book) {
    scrollController.addListener(
      () async {
        try {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            isLoading = true;
            emit(PaginationState());
            from = to + 1;
            to += 15;
            final res = await HadithBooksFetcher.fetchHadithBook(
                book: book, from: from, to: to);
            final data = res
                .map(
                  (e) => HadithModel.fromJson(e),
                )
                .toList();

            hadith = [...hadith, ...data];
            emit(ReadyPaginationState());
          }
        } catch (e) {
          emit(ErrorPaginationState());
        } finally {
          isLoading = false;
        }
      },
    );
  }

  void getHadiths(String book) async {
    try {
      emit(LoadingHadithState());
      final res = await HadithBooksFetcher.fetchHadithBook(
        book: book,
        from: from,
        to: to,
      );
      hadith = res
          .map(
            (e) => HadithModel.fromJson(e),
          )
          .toList();

      emit(HadithSuccessState());
    } catch (e) {
      emit(HadithErrorState(error: e.toString()));
    }
  }

  void getAllHAdithBooks() async {
    try {
      emit(FetchingHadithBooksState());
      final res = await HadithBooksFetcher.fetchAllHadithBooks();
      hadithBooks = res
          .map(
            (e) => HadithBooksModel.fromJson(e),
          )
          .toList();

      emit(FetchingHadithBooksSuccessState());
    } catch (e) {
      emit(FetchingHadithBooksErrorState(error: e.toString()));
    }
  }

  void chooseSpacificZekr({required int index}) async {
    try {
      emit(DetailedAzkarState());
      if (someZekr != null) {
        someZekr!.clear();
      }
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      final List<dynamic> spacificList = response[index]['array'];
      someZekr = spacificList
          .map(
            (e) => InnerAzkar.fromJson(e),
          )
          .toList();
      emit(DetailedAzkarSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
  }

  void initAzkarjson() async {
    try {
      emit(InitializingAzkarState());
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      azkrMOdel = response
          .map(
            (e) => AzkarModel.fromJson(e),
          )
          .toList();
      emit(InitializingAzkarSuccessState());
    } catch (e) {
      emit(
        InitializingAzkarErrorState(
          error: e.toString(),
        ),
      );
    }
  }

  void fetchSurahs() async {
    try {
      emit(FetchingSurahsState());
      final res = await SurahasFetcher.fetchSurahs();
      allSurahs = res
          .map(
            (e) => SurahModel.fromJson(e),
          )
          .toList();
      emit(FetchingSurahSuccesssState());
    } catch (e) {
      emit(
        FetchingSurahErrorState(
          error: e.toString(),
        ),
      );
    }
  }
}
