import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0XFF111821);
  const primaryColorLight = Color(0XFFFFFFFF);
  const primaryColorDark = Color(0XFF040607);
  const highlightColor = Color(0XFF0582CA);
  const disabledColor = Color(0XFFC7D5E0);

  const textTheme = TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: primaryColorLight,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: primaryColorLight,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: highlightColor,
      fontWeight: FontWeight.bold,
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    scaffoldBackgroundColor: primaryColor,
    highlightColor: highlightColor,
    disabledColor: disabledColor,
    textTheme: textTheme,
  );
}
