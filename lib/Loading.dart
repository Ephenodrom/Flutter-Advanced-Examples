import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Loading ..."),
        ),
      ),
    );
  }
}