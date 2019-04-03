import 'dart:convert';

import 'package:advanced_flutter_example/DefaultAppBar.dart';
import 'package:advanced_flutter_example/examples/readingJsonFile/Planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ShoppingCartScreen extends StatefulWidget {
  ShoppingCartScreen();

  final String title = "Reading Json files";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/readingJsonFile";

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartScreen> {
  List<Planet> planets = [];

  @override
  void initState() {
    super.initState();
    loadPlanetsFromAsset().then((planets) {
      setState(() {
        this.planets.addAll(planets);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(widget.title, widget.exampleUrl),
        body: ListView.builder(
            itemCount: planets.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(planets.elementAt(index).name),
                subtitle: Text("Distance from sun : " +
                    planets.elementAt(index).distance +
                    " km"),
              );
            }));
  }

  Future<List<Planet>> loadPlanetsFromAsset() async {
    String content =
        await rootBundle.loadString("assets/json/solarsystem.json");
    Map<String, dynamic> contentAsMap = json.decode(content);
    List data = contentAsMap["data"];
    List<Planet> list = [];
    data.forEach((e) {
      Planet planet = new Planet.fromJson(e);
      list.add(planet);
    });
    return list;
  }
}
