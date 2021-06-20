import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jen_music/pages/home/home_controller.dart';
import 'package:jen_music/widget/preload_page_view.dart';
import 'package:we_slide/we_slide.dart';
import 'dart:ui';

class PlayWidgetView extends GetView {
  final isHome;
  final Widget widget;
  final Widget appBar;
  final Widget bottomBar;
  final WeSlideController weSlideController = WeSlideController();
  final PreloadPageController pageController = PreloadPageController();

  PlayWidgetView(this.widget,
      {this.isHome = false, this.appBar, this.bottomBar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => GetBuilder<HomeController>(
          builder: (HomeController homeController) => WeSlide(
            overlay: true,
            overlayOpacity: homeController.miniPlayView ? 0.4 : 0,
            backgroundColor: Colors.transparent,
            body: widget,
            appBar: appBar,
            appBarHeight: !GetUtils.isNullOrBlank(appBar)
                ? 60.0 + MediaQueryData.fromWindow(window).padding.top
                : 0,
            footer: bottomBar,
            controller: weSlideController,
            panelMaxSize: !homeController.miniPlayView ||
                    orientation == Orientation.landscape
                ? ScreenUtil().setHeight(812)
                : ScreenUtil().setHeight(650),
            panelMinSize: GetUtils.isNullOrBlank(bottomBar) ? 62 : 118.0,
            panel: SizedBox(),
          ),
          id: 'view_type',
          init: HomeController(),
        ),
      ),
    );
  }
}
