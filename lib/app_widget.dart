import 'package:flutter/material.dart';

import 'src/presenter/home/home_page.dart';
import 'utils/extension.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeExt.lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: ThemeExt.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
