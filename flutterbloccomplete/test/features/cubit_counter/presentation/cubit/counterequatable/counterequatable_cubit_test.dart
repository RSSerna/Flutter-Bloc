import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterequatable/counterequatable_cubit.dart';

void main() {
  group("Counter Equatable Cubit Test", () {
    late CounterEquatableCubit counterEquatableCubit;
    setUp(() {
      counterEquatableCubit = CounterEquatableCubit();
    });

    tearDown(() {
      counterEquatableCubit.close();
    });

    test('Inital State must be 1', () {
      expect(counterEquatableCubit.state,
          const CounterEquatableInitialState(counterValue: 1));
    });
    test('Counter Initial counter value must be 1', () {
      expect(counterEquatableCubit.state.counterValue, 1);
    });

    test("Counter Equatable when incremented state mus be IncrementState", () {
      counterEquatableCubit.increment();
      expect(counterEquatableCubit.state,
          const CounterEquatableIncrementState(counterValue: 2));
    });
    test("Counter Equatable when incremented state mus be DecrementState", () {
      counterEquatableCubit.decrement();
      expect(counterEquatableCubit.state,
          const CounterEquatableDecrementState(counterValue: 0));
    });
  });
}
