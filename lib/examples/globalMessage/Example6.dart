import 'package:advanced_flutter_example/DefaultAppBar.dart';
import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/basic/GlobalBloc.dart';
import 'package:advanced_flutter_example/examples/globalMessage/GlobalMessageWrapper.dart';
import 'package:advanced_flutter_example/examples/globalMessage/Message.dart';
import 'package:flutter/material.dart';

class Example6 extends StatefulWidget {
  Example6();

  final String title = "Global Message";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/globalMessage";

  @override
  _Example6State createState() => _Example6State();
}

class _Example6State extends State<Example6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(widget.title, widget.exampleUrl),
        body: GlobalMessageWrapper(Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Succes"),
              onPressed: () {
                BlocProvider.of<GlobalBloc>(context)
                    .messageBloc
                    .addition
                    .add(Message("This is a success message", "success"));
              },
            ),
            RaisedButton(
              child: Text("Info"),
              onPressed: () {
                BlocProvider.of<GlobalBloc>(context)
                    .messageBloc
                    .addition
                    .add(Message("This is a info message", "info"));
              },
            ),
            RaisedButton(
              child: Text("Warning"),
              onPressed: () {
                BlocProvider.of<GlobalBloc>(context)
                    .messageBloc
                    .addition
                    .add(Message("This is a warning message", "warning"));
              },
            ),
            RaisedButton(
              child: Text("Error"),
              onPressed: () {
                BlocProvider.of<GlobalBloc>(context)
                    .messageBloc
                    .addition
                    .add(Message("This is a error message", "error"));
              },
            ),
          ],
        ))));
  }
}
