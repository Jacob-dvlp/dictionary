import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_widget.dart';
import 'src/core/dependecies/getit_setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetitSetup();

  await Hive.initFlutter();
  await Hive.openBox("favoriteWords");
  await Hive.openBox("wordHistory");
  await Hive.openBox("wordsStorage");

  runApp(const AppWidget());
}
