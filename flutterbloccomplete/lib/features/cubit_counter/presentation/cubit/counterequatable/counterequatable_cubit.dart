import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counterequatable_state.dart';

class CounterEquatableCubit extends HydratedCubit<CounterEquatableState> {
  CounterEquatableCubit()
      : super(const CounterEquatableInitialState(counterValue: 1));
  void increment() => emit(
      CounterEquatableIncrementState(counterValue: state.counterValue + 1));
  void decrement() => emit(
      CounterEquatableDecrementState(counterValue: state.counterValue - 1));

  @override
  CounterEquatableState? fromJson(Map<String, dynamic> json) {
    print('Load');
    return CounterEquatableState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterEquatableState state) {
    print('Save');
    return state.toMap();
  }
}
