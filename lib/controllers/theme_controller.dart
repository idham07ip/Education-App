import 'package:education_app2/configs/themes/app_dark_theme.dart';
import 'package:education_app2/configs/themes/app_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _temaGelap;
  late ThemeData _temaCerah;

  @override
  void onInit() {
    inisialiasiTemaData();
    super.onInit();
  }

  inisialiasiTemaData() {
    _temaGelap = TemaGelap().buildTemaGelap();

    _temaCerah = LightTheme().temaCerah();
  }

  //Return Data
  ThemeData get temaGelap => _temaGelap;
  ThemeData get temaCerah => _temaCerah;
}
