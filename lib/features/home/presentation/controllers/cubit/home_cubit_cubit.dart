import 'dart:convert';
import 'dart:math';

import 'package:ana_muslim/core/constants/app_colors.dart';
import 'package:ana_muslim/core/utils/functions.dart';
import 'package:ana_muslim/core/widgets/snack_bar.dart';
import 'package:ana_muslim/features/home/data/hadith.dart';
import 'package:ana_muslim/features/home/data/radio.dart';
import 'package:ana_muslim/features/home/models/azkar_model.dart';
import 'package:ana_muslim/features/home/models/hadith_books_model.dart';
import 'package:ana_muslim/features/home/models/prey_time_model.dart';
import 'package:ana_muslim/features/home/models/radio_model.dart';
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
  late PreyTimesModel preyTimes;
  late List<HadithModel> hadith;
  late List<RadioModel> radioChannels;
  late String randomZekeText;
  late List<HadithBooksModel> hadithBooks;
  int from = 1;
  int to = 15;
  bool isLoading = false;
  HomeCubitCubit() : super(HomeCubitInitial());
  final ScrollController scrollController = ScrollController();

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

  generateCustomZekr() async {
    emit(RandomZekrState());
    try {
      emit(RandomZekrState());
      if (someZekr != null) {
        someZekr!.clear();
      }
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
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

  void getPreyTime() async {
    try {
      emit(FetchingPreyTimeState());
      // final myLocation = await LocationHandler.getuserCurrentLocation();
      final currentDate = getCurrentDate();
      final result = await PrayTimesCall.getPreyTimesByDateAndLocation(
        date: currentDate,
        city: "cairo",
        country: "egypt",
      );
      preyTimes = PreyTimesModel.fromjson(result);
      emit(FetchingPreyTimeSuccessState());
    } catch (e) {
      emit(FetchingPreyTimeErrorState(error: e.toString()));
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
