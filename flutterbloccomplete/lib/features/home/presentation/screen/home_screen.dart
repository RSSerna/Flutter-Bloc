import 'package:flutter/material.dart';
import 'package:flutterbloccomplete/core/constants/router_paths.dart';
import 'package:flutterbloccomplete/shared/widgets/custom_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc & Cubits'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomListTile(
            title: 'Cubit Counter',
            subTitle: 'Un uso simple de un Cubit',
            location: RouterPaths.counterCubit),
        CustomListTile(
            title: 'Cubit Counter Second',
            subTitle: 'De esta forma se esta creando diferentes instancias de un BLoC',
            location: RouterPaths.counterCubitSecond),
        CustomListTile(
            title: 'Cubit Counter Equatable',
            subTitle: 'Un uso simple de un Cubit con Equatable, InternetCubit por BlocListener',
            location: RouterPaths.counterCubitEquatable),
        CustomListTile(
            title: 'Cubit Counter Equatable Second',
            subTitle: 'Mismo BLoC entregado desde un provider del Material App, InternetCubit con context.watch',
            location: RouterPaths.counterCubitEquatableSecond),
        CustomListTile(
            title: 'Cubit Counter Sin State',
            subTitle: 'Cubit que no tiene clase State suscrito al el Internet Cubit',
            location: RouterPaths.counterCubitWithOutState),
        CustomListTile(
            title: 'Cubit Counter Sin State Second',
            subTitle: 'Mismo BLoC Entregado desde el InjectionContainerImpl',
            location: RouterPaths.counterCubitWithOutStateSecond),
      ],
    );
  }
}