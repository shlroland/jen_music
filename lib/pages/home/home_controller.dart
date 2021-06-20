import 'package:get/get.dart';
import 'package:jen_music/pages/find/find_view.dart';
import 'package:jen_music/pages/user/user_view.dart';
import 'package:jen_music/widget/preload_page_view.dart';

class HomeController extends GetxController {
  PreloadPageController pageController;
  var miniPlayView = false;
  final pages = [UserView(), FindView()];
  final items = ['我的', '首页'];
}
