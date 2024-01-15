import 'package:flutter/material.dart';
import 'package:flutterbloccomplete/core/di/injection_container.dart';
import 'package:flutterbloccomplete/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final injectionContainerImpl = InjectionContainerImpl();
  await injectionContainerImpl.init();
  runApp(AppState(
    injectionContainerImpl: injectionContainerImpl,
  ));
}
