import 'package:get/get.dart';
import 'package:jen_music/pages/find/find_view.dart';
import 'package:jen_music/widget/preload_page_view.dart';

class HomeController extends SuperController {
  PreloadPageController pageController;
  var miniPlayView = false;
  final pages = [FindView()];
  final items = ['我的', '首页'];
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
