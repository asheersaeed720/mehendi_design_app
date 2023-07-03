import 'package:flutter/material.dart';
import 'package:mehendi_design_app/utils/constants.dart';

const String fontName = "Nexa";

final lightThemeData = ThemeData(
  iconTheme: IconThemeData(color: Colors.grey.shade800),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: fontName,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: kBodyStyle1.copyWith(color: kPrimaryColor),
    elevation: 0,
    color: Colors.grey.shade50,
    actionsIconTheme: const IconThemeData(color: kPrimaryColor),
    iconTheme: const IconThemeData(color: kPrimaryColor),
  ),
  textTheme: TextTheme(bodySmall: kBodyStyle2),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: customPrimaryColor).copyWith(
    error: Colors.red[800],
  ),
);

Map<int, Color> color = const {
  50: Color.fromRGBO(117, 54, 48, .1),
  100: Color.fromRGBO(117, 54, 48, .2),
  200: Color.fromRGBO(117, 54, 48, .3),
  300: Color.fromRGBO(117, 54, 48, .4),
  400: Color.fromRGBO(117, 54, 48, .5),
  500: Color.fromRGBO(117, 54, 48, .6),
  600: Color.fromRGBO(117, 54, 48, .7),
  700: Color.fromRGBO(117, 54, 48, .8),
  800: Color.fromRGBO(117, 54, 48, .9),
};

MaterialColor customPrimaryColor = MaterialColor(0xFF753630, color);
