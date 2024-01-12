import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWithOutStateCubit extends Cubit<int> {
  CounterWithOutStateCubit() : super(1);
  void increment() =>
      emit(state + 1);
  void decrement() =>
      emit(state - 1);
}