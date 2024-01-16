import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counter/counter_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterequatable/counterequatable_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterwithoutstate/counterwithoutstate_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_internet/presentation/cubit/internet_cubit.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    sl.registerFactory(() => CounterCubit());
    sl.registerFactory(() => CounterEquatableCubit());
    // sl.registerSingleton(CounterEquatableCubit());
    sl.registerFactory(() => Connectivity());
    sl.registerFactory(() => InternetCubit(conectibity: sl()));
    sl.registerSingleton(CounterWithOutStateCubit(internetCubit: sl()));
  }
}
