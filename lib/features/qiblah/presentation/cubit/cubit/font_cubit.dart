import 'package:flutter_bloc/flutter_bloc.dart';

class FontCubit extends Cubit<int> {
  FontCubit() : super(0);

  emitIneger(int number) {
    emit(number);
  }
}
