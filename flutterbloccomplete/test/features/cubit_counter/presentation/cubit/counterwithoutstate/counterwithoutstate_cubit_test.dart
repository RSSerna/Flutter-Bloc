import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterwithoutstate/counterwithoutstate_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_internet/presentation/cubit/internet_cubit.dart';

void main() {
  group("Counter Equatable Cubit Test", () {
    late CounterWithOutStateCubit counterWithOutStateCubit;
    setUp(() {
      counterWithOutStateCubit = CounterWithOutStateCubit(
          internetCubit: InternetCubit(conectibity: Connectivity()));
    });

    tearDown(() {
      counterWithOutStateCubit.close();
    });

    test('Inital State must be 1', () {
      expect(counterWithOutStateCubit.state, 1);
    });

    test("Counter Equatable when incremented state mus be IncrementState", () {
      counterWithOutStateCubit.increment();
      expect(counterWithOutStateCubit.state, 2);
    });
    test("Counter Equatable when incremented state mus be DecrementState", () {
      counterWithOutStateCubit.decrement();
      expect(counterWithOutStateCubit.state, 0);
    });
  });
}
