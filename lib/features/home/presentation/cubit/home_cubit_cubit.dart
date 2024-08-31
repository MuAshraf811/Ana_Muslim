import 'dart:convert';
import 'dart:developer';

import 'package:ana_muslim/features/home/models/azkar_model.dart';
import 'package:ana_muslim/features/home/models/surah_model.dart';
import 'package:ana_muslim/features/qiblah/data/surah_list.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  late List<SurahModel> allSurahs;
  late List<AzkarModel> azkrMOdel;
  List<InnerAzkar>? someZekr;
  HomeCubitCubit() : super(HomeCubitInitial());
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
