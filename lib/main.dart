import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.purple,
      ),
    ));
