part of './extension.dart';

class ThemeExt {
  ThemeExt._();
  ColorExtension colorExtension = ColorExtension();

  static FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(80, 40),
      elevation: 1,
    ),
  );

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minimumSize: const Size(80, 40),
        elevation: 1,
        backgroundColor: ColorExtension.primaryColor.withAlpha(35),
        side: const BorderSide(color: ColorExtension.primaryColor)),
  );
  static ElevatedButtonThemeData? elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minimumSize: const Size(80, 40),
      elevation: 1,
    ),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    filledButtonTheme: filledButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundLight,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ColorExtension.primaryColor,
      onPrimary: Colors.white,
      secondary: ColorExtension.primaryTextLight,
      onSecondary: Colors.white,
      error: ColorExtension.alternateColor,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    filledButtonTheme: filledButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    scaffoldBackgroundColor: ColorExtension.primaryBackgroundDark,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorExtension.primaryColorDark,
      onPrimary: Colors.white,
      secondary: ColorExtension.secondaryColor,
      onSecondary: Colors.black,
      error: ColorExtension.alternateColorDark,
      onError: Colors.white,
      background: ColorExtension.primaryBackgroundDark,
      onBackground: Colors.white,
      surface: Colors.grey,
      onSurface: Colors.white,
    ),
  );


}
