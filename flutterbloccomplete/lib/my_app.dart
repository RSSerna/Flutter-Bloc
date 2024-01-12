import 'package:flutter/material.dart';
import 'package:flutterbloccomplete/core/constants/router_paths.dart';
import 'package:flutterbloccomplete/core/router/app_routers.dart';
import 'package:go_router/go_router.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

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
        _CustomListTile(
            title: 'Cubit Counter',
            subTitle: 'Un uso simple de un Cubit',
            location: RouterPaths.counterCubit),
        _CustomListTile(
            title: 'Cubit Counter Equatable',
            subTitle: 'Un uso simple de un Cubit con Equatable',
            location: RouterPaths.counterCubitEquatable),
        _CustomListTile(
            title: 'Cubit Counter Sin State',
            subTitle: 'Un uso simple de un Cubit que no tiene clase State',
            location: RouterPaths.counterCubitWithOutState),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.go(location),
    );
  }
}
