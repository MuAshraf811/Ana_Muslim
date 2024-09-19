part of 'qibla_cubit.dart';

@immutable
sealed class QiblaState {}

final class QiblaInitial extends QiblaState {}

final class LoadingQiblaInfoState extends QiblaState {}

final class LoadedCompassInfoState extends QiblaState {
  final double heading;

  LoadedCompassInfoState({required this.heading});
}

final class LoadedQiblaInfoState extends QiblaState {
  final double distance;
  final double direction;

  LoadedQiblaInfoState({required this.distance, required this.direction});
}

final class QiblaInfoErrorState extends QiblaState {
  final String errorMessage;

  QiblaInfoErrorState({required this.errorMessage});
}
