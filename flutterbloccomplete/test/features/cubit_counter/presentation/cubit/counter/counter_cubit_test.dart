import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counter/counter_cubit.dart';

void main() {
  group("Counter Cubit Test", () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    //This test doesnt work, that's because this cubit doesnt have equatable
    // test('Inital State must be 1', () {
    //   expect(counterCubit.state, CounterInitialState(counterValue: 1));
    // });
    test('Counter Initial counter value must be 1', () {
      expect(counterCubit.state.counterValue, 1);
    });

    test("Counter Equatable when incremented state mus be IncrementState", () {
      counterCubit.increment();
      expect(counterCubit.state.counterValue, 2);
    });
    test("Counter Equatable when incremented state mus be DecrementState", () {
      counterCubit.decrement();
      expect(counterCubit.state.counterValue, 0);
    });
  });
}
