import 'package:flutter/material.dart';
import 'package:flutterbloccomplete/core/di/injection_container.dart';
import 'package:flutterbloccomplete/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InjectionContainerImpl().init();
  runApp(const MyApp());
}