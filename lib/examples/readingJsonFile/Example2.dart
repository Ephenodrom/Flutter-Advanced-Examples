import 'package:advanced_flutter_example/examples/readingJsonFile/Planet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Example2 extends StatefulWidget {
  Example2();

  final String title = "Reading Json files";

  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {
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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: planets.length,
            itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text(planets.elementAt(index).name),
            subtitle: Text("Distance from sun : "+ planets.elementAt(index).distance + " km"),
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
