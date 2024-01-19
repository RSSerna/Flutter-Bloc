part of 'counterequatable_cubit.dart';

class CounterEquatableState extends Equatable {
  final int counterValue;

  const CounterEquatableState({required this.counterValue});

  @override
  List<Object?> get props => [counterValue];

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterEquatableState.fromMap(Map<String, dynamic> map) {
    return CounterEquatableState(
      counterValue: map['counterValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterEquatableState.fromJson(String source) =>
      CounterEquatableState.fromMap(json.decode(source));
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
