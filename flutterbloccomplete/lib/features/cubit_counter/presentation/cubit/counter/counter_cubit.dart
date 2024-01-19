import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterInitialState(counterValue: 1));
  void increment() =>
      emit(CounterIncrementedState(counterValue: state.counterValue + 1));
  void decrement() =>
      emit(CounterDecrementedState(counterValue: state.counterValue - 1));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
