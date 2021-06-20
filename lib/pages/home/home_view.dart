import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jen_music/pages/home/home_controller.dart';
import 'package:jen_music/widget/play_widget/play_widget_view.dart';
import 'package:jen_music/widget/preload_page_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return _buildHomeView();
  }

  Widget _buildHomeView() {
    return OrientationBuilder(builder: (context, orientation) {
      return PlayWidgetView(
        _buildContent(orientation),
        appBar: _buildAppBar(),
      );
    });
  }

  Widget _buildContent(Orientation orientation) {
    return _pageView();
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

  Widget _buildAppBar() {
    return SafeArea(
        child: Container(
      height: 56.0,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Expanded(
              child: GetBuilder(
            builder: (_) => ListView.builder(
              padding: EdgeInsets.only(top: 5.0),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.0),
                    child: Center(
                      child: Text(
                        controller.items[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () => {},
                );
              },
              itemCount: controller.items.length,
              scrollDirection: Axis.horizontal,
            ),
            init: controller,
            id: 'bottom_bar',
          )),
          IconButton(icon: Icon(Icons.search_outlined), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
    ));
  }

  // Widget _buildSleepClock(Orientation orientation) {
  //   return GetBuilder(
  //     builder: (_) {
  //     return InkWell(
  //       child: orientation == Orientation.portrait ? ,
  //     );
  //   });
  // }
}
