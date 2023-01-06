// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/pages/home_page.dart';
import 'package:e_commerce/pages/login_page.dart';
import 'package:e_commerce/pages/routes.dart';
import 'package:e_commerce/widgets/themelist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      // darkTheme: MyTheme.darkTheme(context),
      home: HomePage(),
    );
  }
}
