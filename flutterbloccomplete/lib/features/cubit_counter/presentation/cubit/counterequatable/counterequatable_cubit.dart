import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counterequatable_state.dart';

class CounterEquatableCubit extends Cubit<CounterEquatableState> {
  CounterEquatableCubit() : super(const CounterEquatableInitialState(counterValue: 1));
  void increment() =>
      emit(CounterEquatableIncrementState(counterValue: state.counterValue + 1));
  void decrement() =>
      emit(CounterEquatableDecrementState(counterValue: state.counterValue - 1));
}
