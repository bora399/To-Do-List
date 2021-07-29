import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: Color(0xff8c52ff),
      accentColor: Colors.lightGreen.shade400,
      unselectedWidgetColor: Colors.deepPurple.shade200,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
  ));
}
