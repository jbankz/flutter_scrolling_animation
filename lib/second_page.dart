import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String img;

  SecondPage(this.img);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Hero(
          tag: 'image',
          child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Image.network(
                widget.img,
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }
}
