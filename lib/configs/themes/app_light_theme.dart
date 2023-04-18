import 'package:education_app2/configs/themes/sub_theme_data_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primaryColorBlueLight = Color(0xFF3ac3cb);
const Color PrimaryColorPinkLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

//
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData {
  temaCerah() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: PrimaryColorPinkLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getTemaIkon(),
      cardColor: cardColor,
      textTheme: getTexttThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
    );
  }
}
