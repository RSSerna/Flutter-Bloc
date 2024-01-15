import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterbloccomplete/core/router/routes.dart';
import 'package:flutterbloccomplete/core/constants/router_paths.dart';
import 'package:flutterbloccomplete/core/di/injection_container.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counterwithoutstate/counterwithoutstate_cubit.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/cubit/counter/counter_cubit.dart';


final router = GoRouter(initialLocation: RouterPaths.home, routes: [
  GoRoute(
    path: RouterPaths.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RouterPaths.counterCubit,
    builder: (context, state) => BlocProvider(
      create: (context) => CounterCubit(),
      child: const CubitCounterScreen(
        title: 'Cubit Counter',
        colorAppbar: Colors.amber,
      ),
    ),
  ),
  GoRoute(
    path: RouterPaths.counterCubitSecond,
    builder: (context, state) => BlocProvider(
      create: (context) => CounterCubit(),
      child: const CubitCounterSecondScreen(
        title: 'Cubit Counter Second',
        colorAppbar: Colors.blueAccent,
      ),
    ),
  ),
  GoRoute(
    path: RouterPaths.counterCubitEquatable,
    builder: (context, state) => const CubitCounterEquatableScreen(
      title: 'Cubit Counter Equatable',
      colorAppbar: Colors.amber,
    ),
  ),
  GoRoute(
    path: RouterPaths.counterCubitEquatableSecond,
    builder: (context, state) => const CubitCounterEquatableSecondScreen(
      title: 'Equatable Second Screen',
      colorAppbar: Colors.blueAccent,
    ),
  ),
  GoRoute(
    path: RouterPaths.counterCubitWithOutState,
    builder: (context, state) => BlocProvider(
      create: (context) =>
          InjectionContainerImpl().sl<CounterWithOutStateCubit>(),
      child: const CubitCounterWithOurStateScreen(
        title: 'Cubit Counter With Out State',
        colorAppbar: Colors.amber,
      ),
    ),
  ),
  GoRoute(
    path: RouterPaths.counterCubitWithOutStateSecond,
    builder: (context, state) => BlocProvider(
      create: (context) =>
          InjectionContainerImpl().sl<CounterWithOutStateCubit>(),
      child: const CubitCounterWithOurStateSecondScreen(
        title: 'Cubit Counter With Out State',
        colorAppbar: Colors.blueAccent,
      ),
    ),
  ),
]);
