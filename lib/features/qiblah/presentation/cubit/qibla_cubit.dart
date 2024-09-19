import 'dart:developer';

import 'package:ana_muslim/core/services/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit() : super(QiblaInitial());

  gitLocation() async {
    try {
      emit(LoadingQiblaInfoState());
      await LocationService.handelPermission();
    } catch (e) {
      log("*************");
      log(e.toString());
      emit(
        QiblaInfoErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
