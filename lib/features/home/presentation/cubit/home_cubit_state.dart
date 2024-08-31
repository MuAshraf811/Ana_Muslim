part of 'home_cubit_cubit.dart';

@immutable
sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class FetchingSurahsState extends HomeCubitState {}

final class FetchingSurahSuccesssState extends HomeCubitState {}

final class FetchingSurahErrorState extends HomeCubitState {
  final String error;

  FetchingSurahErrorState({
    required this.error,
  });
}

final class InitializingAzkarState extends HomeCubitState {}

final class InitializingAzkarSuccessState extends HomeCubitState {}

final class InitializingAzkarErrorState extends HomeCubitState {
  final String error;

  InitializingAzkarErrorState({required this.error});
}

final class DetailedAzkarState extends HomeCubitState {}

final class DetailedAzkarSuccessState extends HomeCubitState {}
