import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scrolling_animation/first_page.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.black),
      home: Scaffold(
        body: Center(
          child: AnimateOnScrollFlutter(),
        ),
      ),
    );
  }
}
