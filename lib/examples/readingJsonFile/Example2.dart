import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  Example2();

  final String title = "Example2";

  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

      ),
    );
  }
}
