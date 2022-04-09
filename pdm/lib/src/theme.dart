import 'package:flutter/material.dart';

class AppColors{
  static const primaryLight = Color(0xFFFFFFFF);
  static const primaryDark = Color(0xFF02141F);
  static const textIconLight = Color(0xFFCE2121);
  static const textIconDark = Color(0xFFF0B033);
  static const secondaryLight = Color(0xFF02141F);
  static const secondaryDark = Color(0xFF4AFADA);
  static const tertiary = Color(0xFF8c92ac);

}

TextStyle get _headline1 => const TextStyle(
  fontSize: 28,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  color: AppColors.textIconLight,
);

TextStyle get _subtitle1 => const TextStyle(
  fontSize: 22,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  color: AppColors.textIconLight,
);

TextStyle get _bodytext1 => const TextStyle(
  fontSize: 12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  color: AppColors.textIconLight,
);

TextStyle get _caption => const TextStyle(
  fontSize: 12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: AppColors.textIconLight,
);

TextStyle get _overline => const TextStyle(
  fontSize: 12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: AppColors.textIconLight,
);

ThemeData getTheme(){

  final Theme = ThemeData.light().copyWith(

    colorScheme: const ColorScheme.light().copyWith(

      primary: AppColors.primaryLight,
      onPrimary: AppColors.textIconLight,
      primaryContainer: AppColors.textIconLight,
      onPrimaryContainer: AppColors.textIconLight,
      secondary: AppColors.secondaryLight,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.primaryLight,

    )

  );

  return Theme;

}


