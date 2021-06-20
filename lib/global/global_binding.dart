import 'package:get/get.dart';
import 'package:jen_music/pages/find/find_controller.dart';
import 'package:jen_music/pages/user/user_controller.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FindController>(FindController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
  }
}
