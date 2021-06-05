import 'package:flutter/material.dart';
import 'package:jen_music/navigator/jen_navigator.dart';
import 'package:jen_music/pages/album_page.dart';
import 'package:jen_music/pages/home_page.dart';
import 'package:jen_music/pages/profile_page.dart';
import 'package:jen_music/pages/search_page.dart';
import 'package:jen_music/utils/color.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = primary;
  static int initialPage = 0;
  final PageController _controller = PageController(initialPage: initialPage);
  List<Widget> _pages;
  bool _hasBuild = false;

  @override
  Widget build(BuildContext context) {
    _pages = [
      HomePage(),
      SearchPage(),
      AlbumPage(),
      ProfilePage(),
    ];
    if (!_hasBuild) {
      JenNavigator.getInstance()
          .onBottomTabChange(initialPage, _pages[initialPage]);
      _hasBuild = true;
    }
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _pages,
        onPageChanged: (index) => _onJumpTo(index, pageChange: true),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => _onJumpTo(index),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _activeColor,
        items: [
          _bottomItem('首页', Icons.home),
          _bottomItem('搜索', Icons.search_outlined),
          _bottomItem('歌单', Icons.whatshot_outlined),
          _bottomItem('我的', Icons.person_outlined),
        ],
      ),
    );
  }

  _bottomItem(
    String title,
    IconData icon,
  ) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(icon, color: _activeColor),
        label: title);
  }

  void _onJumpTo(int index, {pageChange = false}) {
    if (!pageChange) {
      //让PageView展示对应tab
      _controller.jumpToPage(index);
    } else {
      JenNavigator.getInstance().onBottomTabChange(index, _pages[index]);
    }
    setState(() {
      //控制选中第一个tab
      _currentIndex = index;
    });
  }
}
