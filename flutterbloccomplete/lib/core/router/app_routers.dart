import 'package:flutterbloccomplete/core/constants/router_paths.dart';
import 'package:flutterbloccomplete/features/cubit_counter/presentation/screen/counter_screen.dart';
import 'package:flutterbloccomplete/my_app.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(initialLocation: RouterPaths.home, routes: [
  GoRoute(
    path: RouterPaths.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RouterPaths.counterCubit,
    builder: (context, state) => const CubitCounterScreen(title: 'Cubit Counter',),
  ),
  GoRoute(
    path: RouterPaths.counterCubitEquatable,
    builder: (context, state) => const CubitCounterScreen(title: 'Cubit Counter Equatable',),
  ),
  GoRoute(
    path: RouterPaths.counterCubitWithOutState,
    builder: (context, state) => const CubitCounterScreen(title: 'Cubit Counter With Out State',),
  ),
]);
