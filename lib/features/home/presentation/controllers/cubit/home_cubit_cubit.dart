import 'dart:convert';
import 'dart:developer';

import 'package:ana_muslim/core/utils/functions.dart';
import 'package:ana_muslim/features/home/data/hadith.dart';
import 'package:ana_muslim/features/home/models/azkar_model.dart';
import 'package:ana_muslim/features/home/models/hadith_books_model.dart';
import 'package:ana_muslim/features/home/models/prey_time_model.dart';
import 'package:ana_muslim/features/home/models/surah_model.dart';
import 'package:ana_muslim/features/qiblah/data/surah_list.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/pray_time.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  late List<SurahModel> allSurahs;
  late List<AzkarModel> azkrMOdel;
  List<InnerAzkar>? someZekr;
  late PreyTimesModel preyTimes;
  late List<HadithBooksModel> hadithBooks;
  HomeCubitCubit() : super(HomeCubitInitial());

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
        latitude: 30.434822,
        longitude: 31.48655,
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
      log("$e");
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
      log("==========================> $e");
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
