import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jen_music/global/global_theme.dart';
import 'package:jen_music/routes/app_routes.dart';

import 'global/global_binding.dart';

void main() {
  var theme;
  GlobalBinding().dependencies();
  theme = lightTheme;
  runApp(ScreenUtilInit(
    builder: () => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
    designSize: Size(375.0, 812.0),
  ));
}
