import 'package:get/get.dart';
import 'package:jen_music/pages/home/home_bindings.dart';
import 'package:jen_music/pages/home/home_view.dart';

class AppPages {
  static const INITIAL = '/home';
  static final routes = [
    GetPage(name: '/home', page: () => HomeView(), binding: HomeBinding()),
  ];
}
