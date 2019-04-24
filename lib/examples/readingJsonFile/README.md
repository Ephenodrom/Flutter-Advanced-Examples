# Reading Json File

## Description

Reading a json file from the asset folder and displaying it's content in the ui.

## Structure

We have the empty list of planets at the beginning.

```dart
List<Planet> planets = [];
```

We load the data from the json file in the **initState()** method. When we receive the lists of planets,
we update the screen by calling the **setState()** method. We simple build the list of planets with
the help of a **ListView** builder in the **build()** method.

```dart
loadPlanetsFromAsset().then((planets) {
  setState(() {
    this.planets.addAll(planets);
  });
});
```

We use the rootBundle to load the json as a string, then converting it to our model.

```dart
Future<List<Planet>> loadPlanetsFromAsset() async {
  String content = await rootBundle.loadString("assets/json/solarsystem.json");
  Map<String, dynamic> contentAsMap = json.decode(content);
  List data = contentAsMap["data"];
  List<Planet> list = [];
  data.forEach((e) {
    Planet planet = new Planet.fromJson(e);
    list.add(planet);
  });
  return list;
}
```
