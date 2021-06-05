import 'package:flutter/material.dart';

import 'bottom_navigator.dart';

typedef RouteChangeListener(RouteStatusInfo current, RouteStatusInfo pre);

///创建页面
pageWrap(Widget child) {
  return MaterialPage(key: ValueKey(child.hashCode), child: child);
}

/// 获取routeStatus在页面栈中的位置
int getPageIndex(List<MaterialPage> pages, RouteStatus routeStatus) {
  for (var i = 0; i < pages.length; i++) {
    MaterialPage page = pages[i];
    if (getStatus(page) == routeStatus) {
      return i;
    }
  }
  return -1;
}

enum RouteStatus { home, player, detail, unknow }

RouteStatus getStatus(MaterialPage page) {
  if (page.child is BottomNavigator) {
    return RouteStatus.home;
  } else {
    return RouteStatus.unknow;
  }
}

class RouteStatusInfo {
  final RouteStatus routeStatus;
  final Widget page;

  RouteStatusInfo(this.routeStatus, this.page);
}

///抽象类供Navigator实现
abstract class _RouteJumpListener {
  void onJumpTo(RouteStatus routeStatus, {Map args});
}

typedef OnJumpTo = void Function(RouteStatus routeStatus, {Map args});

///定义路由跳转逻辑要实现的功能
class RouteJumpListener {
  final OnJumpTo onJumpTo;

  RouteJumpListener({this.onJumpTo});
}

///监听路由页面跳转
///感知当前页面是否压后台
class JenNavigator extends _RouteJumpListener {
  static JenNavigator _instance;

  RouteJumpListener _routeJump;
  List<RouteChangeListener> _listeners = [];
  RouteStatusInfo _current;

  //首页底部tab
  RouteStatusInfo _bottomTab;

  JenNavigator._();

  static JenNavigator getInstance() {
    if (_instance == null) {
      _instance = JenNavigator._();
    }
    return _instance;
  }

  @override
  void onJumpTo(RouteStatus routeStatus, {Map args}) {
    _routeJump.onJumpTo(routeStatus, args: args);
  }

  void _notify(RouteStatusInfo current) {
    if (current.page is BottomNavigator && _bottomTab != null) {
      //如果打开的是首页，则明确到首页具体的tab
      current = _bottomTab;
    }
    print('hi_navigator:current:${current.page}');
    print('hi_navigator:pre:${_current?.page}');
    _listeners.forEach((listener) {
      listener(current, _current);
    });
    _current = current;
  }

  ///通知路由页面变化
  void notify(List<MaterialPage> currentPages, List<MaterialPage> prePages) {
    if (currentPages == prePages) return;
    var current =
        RouteStatusInfo(getStatus(currentPages.last), currentPages.last.child);
    _notify(current);
  }

  ///首页底部tab切换监听
  void onBottomTabChange(int index, Widget page) {
    _bottomTab = RouteStatusInfo(RouteStatus.home, page);
    _notify(_bottomTab);
  }

  ///注册路由跳转逻辑
  void registerRouteJump(RouteJumpListener routeJumpListener) {
    this._routeJump = routeJumpListener;
  }

  ///监听路由页面跳转
  void addListener(RouteChangeListener listener) {
    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  ///移除监听
  void removeListener(RouteChangeListener listener) {
    _listeners.remove(listener);
  }
}
