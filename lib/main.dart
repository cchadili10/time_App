import 'package:flutter/material.dart';
import 'package:time_app/pages/Home.dart';
import 'package:time_app/pages/Location.dart';
import 'package:time_app/pages/Loading.dart';
void main() {
  runApp(MaterialApp(
    // home:Home() ,
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context) => Location(),
    },
  ));
}

