import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jen_music/pages/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jen_music/widget/preload_page_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return _buildHomeView();
  }

  Widget _buildHomeView() {
    return OrientationBuilder(builder: (context, orientation) {
      return _buildContent(orientation);
    });
  }

  Widget _buildContent(Orientation orientation) {
    return orientation == Orientation.portrait
        ? _pageView()
        : Column(
            children: [
              SafeArea(child: SizedBox()),
              Expanded(
                  child: Row(
                children: [
                  SizedBox(
                    width: 140.h,
                    child: Column(
                      children: [],
                    ),
                  )
                ],
              ))
            ],
          );
  }

  Widget _pageView() {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: PreloadPageView.builder(
        controller: controller.pageController,
        preloadPagesCount: 2,
        itemBuilder: (context, index) => controller.pages[index],
        itemCount: controller.pages.length,
      ),
    );
  }
}
