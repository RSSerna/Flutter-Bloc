import 'package:flutter/material.dart';
import 'package:flutterbloccomplete/core/di/injection_container.dart';
import 'package:flutterbloccomplete/my_app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  final injectionContainerImpl = InjectionContainerImpl();
  await injectionContainerImpl.init();
  runApp(AppState(
    injectionContainerImpl: injectionContainerImpl,
  ));
}
