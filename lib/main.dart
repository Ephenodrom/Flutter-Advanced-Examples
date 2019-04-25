import 'package:advanced_flutter_example/ExampleList.dart';
import 'package:advanced_flutter_example/basic/BlocProvider.dart';
import 'package:advanced_flutter_example/basic/GlobalBloc.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlobalBloc>(
        bloc: GlobalBloc(),
        child: MaterialApp(
          title: 'Flutter Advanced Example',
          home: Home(title: 'Examples'),
        ));
  }
}

class Home extends StatefulWidget {
  final String title;

  Home({this.title});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  HomeState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(child: ExampleList()),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
