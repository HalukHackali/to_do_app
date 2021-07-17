import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ColorThemeData with ChangeNotifier{

  final ThemeData _greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
  );

  final ThemeData _redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    accentColor: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.red),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
  );

  ThemeData _selectedThemeData = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
  );

  bool _isGreen = true;

  static SharedPreferences _sharedPrefer;

  bool get isGreen => _isGreen;


  void switchTheme(bool selected){
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  ThemeData get selectedThemeData => _isGreen ? _greenTheme : _redTheme;


  Future<void> createPrefObject()async{
    _sharedPrefer=await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value){
    _sharedPrefer.setBool('themeData', value);
    print(_sharedPrefer.getBool('themeData'));
  }

  void loadThemeFromSharedPref(){
    _isGreen = _sharedPrefer.getBool('themeData') ?? true;
    print(_isGreen);
  }

}