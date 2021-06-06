import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    accentColor: Colors.pinkAccent,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarColor: Colors.black,
    cardTheme: CardTheme(
      shadowColor: Colors.pinkAccent.withOpacity(0.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12.0)),
      clipBehavior: Clip.antiAlias,
    ),
    iconTheme: IconThemeData(color: Colors.grey[800]),
    appBarTheme: AppBarTheme(
      shadowColor: Colors.green[300].withOpacity(.1),
      elevation: 0.0,
    ));
final ThemeData darkTheme = ThemeData(
    accentColor: Colors.pinkAccent,
    brightness: Brightness.dark,
    // secondaryHeaderColor: Colors.white,
    bottomAppBarColor: Colors.white,
    primaryColor: Colors.grey[850],
    scaffoldBackgroundColor: Colors.grey[850],
    cardTheme: CardTheme(
      shadowColor: Colors.blue[300].withOpacity(.1),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12.0)),
      clipBehavior: Clip.antiAlias,
    ),
    iconTheme: IconThemeData(color: Colors.grey[300]),
    appBarTheme: AppBarTheme(
      shadowColor: Colors.blue[300].withOpacity(.1),
      elevation: 0.0,
    ));
