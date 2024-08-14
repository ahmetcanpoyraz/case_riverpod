import 'package:case_riverpod/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.blue,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 24.sp, color: AppColors.black),
      bodyMedium: TextStyle(fontSize: 20.sp, color: AppColors.black),
      displayMedium: TextStyle(fontSize: 16.sp, color: AppColors.black),
      displaySmall: TextStyle(fontSize: 12.sp, color: AppColors.black),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.blue,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: AppColors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      color: AppColors.blueGrey,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(fontSize: 24.sp, color: AppColors.white),
      bodyMedium: TextStyle(fontSize: 20.sp, color: AppColors.white),
      displayMedium: TextStyle(fontSize: 16.sp, color: AppColors.white),
      displaySmall: TextStyle(fontSize: 12.sp, color: AppColors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.blueGrey,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.blueGrey,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      fillColor: AppColors.grey,
    ),
  );
}
