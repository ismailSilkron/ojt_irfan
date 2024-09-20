import 'package:flutter/material.dart';
import 'package:ojt_irfan/config/theme/app_pallete.dart';

class AppTheme {
  static ThemeData lightThemeMode(BuildContext context) =>
      ThemeData.light().copyWith(
        appBarTheme: _appBarTheme(context, Brightness.light),
        colorScheme: const ColorScheme.light().copyWith(
          background: AppPallete.pinkColor,
          primary: Colors.black,
        ),
        scaffoldBackgroundColor: AppPallete.whiteColor,
        // textTheme: _textTheme(context, Brightness.light),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          // enableBorder only displayed when it is not focused (click)
          enabledBorder: _border(),
          // focusedBorder only displayed when user using it (typing/click)
          focusedBorder: _border(AppPallete.gradient2),
          border: _border(),
        ),
      );

  static ThemeData darkThemeMode(BuildContext context) =>
      ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppPallete.backgroundColor,
        appBarTheme: _appBarTheme(context, Brightness.dark),
        // textTheme: _textTheme(context, Brightness.dark),
      );

  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );

  static AppBarTheme _appBarTheme(
    BuildContext context,
    Brightness brightness,
  ) =>
      AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: brightness == Brightness.dark
              ? AppPallete.whiteColor
              : Colors.black,
        ),
        backgroundColor: brightness == Brightness.dark
            ? AppPallete.backgroundColor
            : AppPallete.whiteColor,
        iconTheme: IconThemeData(
          color: brightness == Brightness.dark
              ? AppPallete.whiteColor
              : Colors.black,
        ),
      );

  static TextTheme _textTheme(BuildContext context, Brightness brightness) {
    final Color primaryColor = (brightness == Brightness.light)
        ? AppPallete.pinkColor
        : AppPallete.whiteColor;

    return TextTheme(
      titleMedium: TextStyle(
        color: primaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
      titleLarge: TextStyle(
        color: primaryColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.15,
      ),
    );
  }
}
