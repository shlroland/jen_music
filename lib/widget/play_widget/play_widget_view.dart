import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jen_music/pages/home/home_controller.dart';
import 'package:we_slide/we_slide.dart';
import 'dart:ui';

class PlayWidgetView extends GetView {
  final isHome;
  final Widget widget;
  final Widget appBar;
  final Widget bottomBar;

  PlayWidgetView(this.widget,
      {this.isHome = false, this.appBar, this.bottomBar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => GetBuilder<HomeController>(
          builder: (HomeController homeController) => WeSlide(
            // overlay: true,
            backgroundColor: Colors.transparent,
            body: widget,
            appBar: appBar,
            appBarHeight: !GetUtils.isNullOrBlank(appBar)
                ? 56.0 + MediaQueryData.fromWindow(window).padding.top + 6
                : 0,
            footer: bottomBar,
            panel: SizedBox(),
          ),
          id: 'view_type',
          init: HomeController(),
        ),
      ),
    );
  }
}
