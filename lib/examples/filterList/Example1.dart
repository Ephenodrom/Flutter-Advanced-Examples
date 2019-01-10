import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  Example1();

  final String title = "Example1";

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        

      ),
    );
  }
}
