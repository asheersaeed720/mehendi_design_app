import 'package:flutter/material.dart';
import 'package:mehendi_design_app/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;

const Color kPrimaryColor = Color(0xFF753630);
const Color kAccentColor = Color(0xFFa46843);

TextStyle kTitleStyle = TextStyle(
  fontFamily: fontName,
  color: Colors.grey.shade800,
  fontWeight: FontWeight.bold,
  fontSize: 24.0,
);

TextStyle kBodyStyle1 = const TextStyle(
  fontFamily: fontName,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

TextStyle kBodyStyle2 = const TextStyle(
  fontFamily: fontName,
  color: kPrimaryColor,
  fontSize: 15,
);

BoxShadow kBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.2),
  spreadRadius: 2,
  blurRadius: 3,
  offset: const Offset(0, 2),
);

const double kBorderRadius = 10.0;
