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

final class FetchingPreyTimeState extends HomeCubitState {}

final class FetchingPreyTimeSuccessState extends HomeCubitState {}

final class FetchingPreyTimeErrorState extends HomeCubitState {
  final String error;

  FetchingPreyTimeErrorState({required this.error});
}

final class FetchingHadithBooksState extends HomeCubitState {}

final class FetchingHadithBooksSuccessState extends HomeCubitState {}

final class FetchingHadithBooksErrorState extends HomeCubitState {
  final String error;

  FetchingHadithBooksErrorState({required this.error});
}

final class LoadingHadithState extends HomeCubitState {}

final class HadithSuccessState extends HomeCubitState {}

final class HadithErrorState extends HomeCubitState {
  final String error;

  HadithErrorState({required this.error});
}

final class PaginationState extends HomeCubitState {}

final class ReadyPaginationState extends HomeCubitState {}

final class ErrorPaginationState extends HomeCubitState {}

final class GettingRadioState extends HomeCubitState {}

final class RadioSuccessState extends HomeCubitState {}

final class RadioErrorState extends HomeCubitState {
  final String error;

  RadioErrorState({required this.error});
}

final class RandomZekrState extends HomeCubitState {}

final class RandomZekrSuccessState extends HomeCubitState {}

final class RandomZekrErrorState extends HomeCubitState {
  final String error;

  RandomZekrErrorState({required this.error});
}

final class ShareRandomZekrSuccessState extends HomeCubitState {}

final class ShareRandomZekrState extends HomeCubitState {}

final class ListCollapsedState extends HomeCubitState {}

final class LoadingListCollapsedState extends HomeCubitState {}
