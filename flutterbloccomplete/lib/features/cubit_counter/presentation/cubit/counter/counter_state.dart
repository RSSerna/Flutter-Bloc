part of 'counter_cubit.dart';

sealed class CounterState {
  int counterValue;
  CounterState({required this.counterValue,});
}

final class CounterInitialState extends CounterState {
  CounterInitialState({required super.counterValue});
}
final class CounterIncrementedState extends CounterState {
  CounterIncrementedState({required super.counterValue});
}
final class CounterDecrementedState extends CounterState {
  CounterDecrementedState({required super.counterValue});
}
