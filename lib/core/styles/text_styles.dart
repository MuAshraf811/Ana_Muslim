import 'package:ana_muslim/core/styles/app_font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  String fontFamily, {
  bool isItalic = false,
}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,
      fontStyle: isItalic ? FontStyle.normal : FontStyle.italic);
}

// regular style

TextStyle getRegularStyle({
  required double fontSize,
  required Color color,
  String fontFamily = FontConstants.latoFontFamily,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.regular,
    color,
    fontFamily,
  );
}

// medium style

TextStyle getLightStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontConstants.latoFontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.light,
    color,
    fontFamily,
  );
}

// bold style

TextStyle getBoldStyle(
    {required double fontSize,
    required Color color,
    String fontFamily = FontConstants.latoFontFamily,
    bool isItalic = false}) {
  return _getTextStyle(
    fontSize,
    FontWeightManager.bold,
    color,
    fontFamily,
  );
}
