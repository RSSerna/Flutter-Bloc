part of 'counterequatable_cubit.dart';

sealed class CounterEquatableState extends Equatable{
  final int counterValue;

  const CounterEquatableState({ required this.counterValue});

  @override
  List<Object?> get props => [counterValue];
}

final class CounterEquatableInitialState extends CounterEquatableState {
  const CounterEquatableInitialState({required super.counterValue});

  @override
  List<Object?> get props => [counterValue];
}
final class CounterEquatableIncrementState extends CounterEquatableState {
  const CounterEquatableIncrementState({required super.counterValue});

  @override
  List<Object?> get props => [counterValue];
}
final class CounterEquatableDecrementState extends CounterEquatableState {
  const CounterEquatableDecrementState({required super.counterValue});

  @override
  List<Object?> get props => [counterValue];
}
