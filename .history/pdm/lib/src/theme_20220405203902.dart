import 'package:flutter/material.dart';

class AppColors{
  static const PrimaryLight = Color(0xFFFFFFFF);
  static const PrimaryDark = Color(0xFF02141F);
  static const TextIconLight = Color(0xFFCE2121);
  static const TextIconDark = Color(0xFFF0B033);
  static const SecondaryLight = Color(0xFF02141F);
  static const SecondaryDark = Color(0xFF4AFADA);
  static const Tertiary = Color(0xFF8c92ac);

}

TextStyle get _headline1 => const TextStyle(
  fontSize: 28,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  color: AppColors.TextIconLight,
);

TextStyle get _subtitle1 => const TextStyle(
  fontSize: 22,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  color: AppColors.TextIconLight,
);

TextStyle get _bodytext1 => const TextStyle(
  fontSize: 12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  color: AppColors.TextIconLight,
);

TextStyle get _caption => const TextStyle(
  fontSize: 12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: AppColors.TextIconLight,
);

TextStyle get _overline => const TextStyle(
  fontSize: 12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  color: AppColors.TextIconLight,
);

ThemeData getTheme(){

  final Theme = ThemeData.light().copyWith(

    colorScheme: const ColorScheme.light().copyWith(

      primary: AppColors.PrimaryLight,
      onPrimary: AppColors.TextIconLight,
      primaryContainer: AppColors.TextIconLight,
      onPrimaryContainer: AppColors.TextIconLight,
      secondary: AppColors.SecondaryLight,
      tertiary: AppColors.Tertiary,
      onTertiary: AppColors.PrimaryLight,

    )

  );

  return Theme;

}


