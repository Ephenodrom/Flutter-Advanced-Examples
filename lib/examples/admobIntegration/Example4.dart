import 'package:flutter/material.dart';

class Example4 extends StatefulWidget {
  Example4();

  final String title = "Example4";

  @override
  _Example4State createState() => _Example4State();
}

class _Example4State extends State<Example4> {

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
