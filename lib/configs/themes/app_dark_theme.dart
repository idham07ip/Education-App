import 'package:education_app2/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primaryDarkColorBlue = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

class TemaGelap with SubThemeData {
  ThemeData buildTemaGelap() {
    final ThemeData systemTemaGelap = ThemeData.dark();
    return systemTemaGelap.copyWith(
      iconTheme: getTemaIkon(),
      textTheme: getTexttThemes().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
    );
  }
}
