import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloccomplete/core/constants/enums.dart';
import 'package:flutterbloccomplete/features/cubit_internet/presentation/cubit/internet_cubit.dart';

class CounterWithOutStateCubit extends Cubit<int> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;
  CounterWithOutStateCubit({required this.internetCubit}) : super(1) {
    // monitorInternetCubit();
  }

  void monitorInternetCubit() {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnectedState &&
          internetState.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetState is InternetConnectedState &&
          internetState.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
  @override
  Future<void> close() {
    print("WithoutState Closed");
    // internetStreamSubscription.cancel();
    return super.close();
  }
}