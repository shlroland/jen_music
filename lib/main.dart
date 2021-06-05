import 'package:flutter/material.dart';
import 'package:jen_music/navigator/jen_navigator.dart';
import 'package:jen_music/utils/color.dart';

import 'navigator/bottom_navigator.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatefulWidget {
  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
   JenRouteDelegate _routeDelegate = JenRouteDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Router(routerDelegate: _routeDelegate),
      theme: ThemeData(primarySwatch: white),
    );
  }
}

class JenRouteDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;
  RouteStatus _routeStatus = RouteStatus.home;
  List<MaterialPage> pages = [];

  JenRouteDelegate() : navigatorKey = GlobalKey<NavigatorState>() {
    JenNavigator.getInstance().registerRouteJump(
        RouteJumpListener(onJumpTo: (RouteStatus routeStatus, {Map args}) {
      _routeStatus = routeStatus;
      notifyListeners();
    }));
  }

  RouteStatus get routeStatus {
    return _routeStatus;
  }

  @override
  Widget build(BuildContext context) {
    var index = getPageIndex(pages, routeStatus);
    List<MaterialPage> tempPages = pages;
    if (index != -1) {
      //要打开的页面在栈中已存在，则将该页面和它上面的所有页面进行出栈
      //tips 具体规则可以根据需要进行调整，这里要求栈中只允许有一个同样的页面的实例
      tempPages = tempPages.sublist(0, index);
    }
    var page;
    if (routeStatus == RouteStatus.home) {
      //跳转首页时将栈中其它页面进行出栈，因为首页不可回退
      pages.clear();
      page = pageWrap(BottomNavigator());
    }
    //重新创建一个数组，否则pages因引用没有改变路由不会生效
    tempPages = [...tempPages, page];
    //通知路由发生变化
    JenNavigator.getInstance().notify(tempPages, pages);
    pages = tempPages;
    return WillPopScope(
      //fix Android物理返回键，无法返回上一页问题@https://github.com/flutter/flutter/issues/66349
      onWillPop: () async => !await navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (route, result) {
          //执行返回操作
          if (!route.didPop(result)) {
            return false;
          }
           var tempPages = [...pages];
          pages.removeLast();
           pages.removeLast();
          //通知路由发生变化
          JenNavigator.getInstance().notify(pages, tempPages);
          return true;
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
