import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:time_app/services/word_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async {
    Wordtime wordtime =
        Wordtime(location: 'Casablanca', flag: 'flag', url: 'Africa/Casablanca');
    await wordtime.getTime();
    // Navigator.pushReplacementNamed(context, '/home',arguments: {
    //   'location':wordtime.location,
    //   'flag':wordtime.flag,
    //   'time': wordtime.time
    // });

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wordtime.location,
      'flag': wordtime.flag,
      'time': wordtime.time,
      'isDaytime': wordtime.isDaytime
      
    });
    // print(wordtime
    // print(wordtime.time);
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      body: Center(
       
        child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50.0,
          ),
      )
    );
  }
}
