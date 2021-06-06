import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jen_music/global/global_theme.dart';

void main() {
  var theme;

  theme = lightTheme;
  runApp(ScreenUtilInit(
    builder: () => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      enableLog: true,
    ),
    designSize: Size(375.0, 812.0),
  ));
}
