import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UserController extends GetxController {
  var lovePlayList = [].obs;
  var createPlayList = [].obs;
  var collectPlayList = [].obs;
  final isNoCreate = false.obs;
  final isNoCollect = false.obs;
  final privacy = false.obs;
  RefreshController refreshController;

@override
  void onInit() {
    refreshController = RefreshController();
    super.onInit();
  }
}
