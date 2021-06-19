import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindController extends GetxController {
  RefreshController refreshController;
 final currentIndexPage = 0.obs;
  // static FindController get to => Get.find();

  @override
  void onInit() {
    refreshController = RefreshController(initialRefresh: false);
    super.onInit();
  }
}
