part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  CounterState({required this.counterValue,});

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) => CounterState.fromMap(json.decode(source));
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
