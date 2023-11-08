import 'package:dictionary_app/src/presenter/pages/details/dependecies/app_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/presenter/home/home_page.dart';
import 'src/presenter/pages/details/controller/details_cubit.dart';

import 'src/presenter/pages/word/controllers/words_dictionary_cubit.dart';
import 'src/presenter/pages/word/dependecies/app_dependecies.dart';
import 'utils/extension.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WordsDictionaryCubit>(
          create: (context) => AppDependeciesHome.getIt<WordsDictionaryCubit>(),
        ),
        BlocProvider<DetailsCubit>(
          create: (context) => AppDependeciesDetails.getIt<DetailsCubit>(),
        ),
      
      ],
      child: MaterialApp(
        theme: ThemeExt.lightTheme,
        themeMode: ThemeMode.light,
        darkTheme: ThemeExt.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
