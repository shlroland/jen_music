import 'package:flutter/material.dart';
import 'package:jen_music/utils/color.dart';

class BottomNavigator extends StatefulWidget {
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  final _defaultColor = Colors.grey;
  final _activeColor = primary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

  void _onJumpTo(int index) {
    setState(() {
      //控制选中第一个tab
      _currentIndex = index;
    });
  }
}
