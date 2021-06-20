import 'package:get/get.dart';
import 'package:jen_music/widget/preload_page_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindController extends GetxController {
  RefreshController refreshController;
  PreloadPageController pageController;
  final currentIndexPage = 0.obs;
  bool isLoad = false;
  
  static FindController get to => Get.find();

  @override
  void onInit() {
    refreshController = RefreshController(initialRefresh: false);
    pageController = PreloadPageController();
    super.onInit();
  }
}
