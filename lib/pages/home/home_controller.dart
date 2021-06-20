import 'package:get/get.dart';
import 'package:jen_music/pages/find/find_view.dart';
import 'package:jen_music/pages/user/user_view.dart';
import 'package:jen_music/widget/preload_page_view.dart';

class HomeController extends GetxController {
  PreloadPageController pageController;
  bool miniPlayView = false;
  int currentIndex = 1;
  final pages = [UserView(), FindView()];
  final items = ['我的', '首页'];

  void changeIndex(int index) {
    pageController.jumpToPage(index);
    onPageChange(index);
  }

  /// 页面发生变化
  onPageChange(int index) {
    currentIndex = index;
    update(['bottom_bar']);
    // Future.delayed(Duration(microseconds: 500), () {
    //   if (index == 0 && !UserController.to.isLoad) {

    //   }
    // });
  }

  @override
  void onInit() {
    pageController = PreloadPageController(initialPage: currentIndex);
    super.onInit();
  }
}
