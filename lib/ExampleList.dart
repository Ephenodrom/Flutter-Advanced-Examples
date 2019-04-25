import 'package:advanced_flutter_example/examples/filterList/Example1.dart';
import 'package:advanced_flutter_example/examples/globalMessage/Example6.dart';
import 'package:advanced_flutter_example/examples/managingFavoritesInSharedPreferences/Example3.dart';
import 'package:advanced_flutter_example/examples/managingInputsWithinModalBottomsheet/Example4.dart';
import 'package:advanced_flutter_example/examples/readingJsonFile/Example2.dart';
import 'package:advanced_flutter_example/examples/shoppingCart/Example5.dart';
import 'package:flutter/material.dart';

class ExampleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: new Text("Filtering List"),
          subtitle: new Text("Apply different filters to a list of cars."),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example1()),
            );
          },
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: new Text("Reading Json files"),
          subtitle: new Text(
              "Loading data from a json file inside the asset folder."),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example2()),
            );
          },
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: new Text("Managing Favorites"),
          subtitle: new Text(
              "Mark your favorite meal and save it in the shared preferences."),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example3()),
            );
          },
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: new Text("Managing inputs within modal / bottom sheet"),
          subtitle: new Text(
              "Outsourcing checkboxes, radiobuttons and switches to a modal or a bottomsheet."),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example4()),
            );
          },
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: new Text("Shopping Cart"),
          subtitle: new Text("Managing a shopping cart with BLOC logic"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example5()),
            );
          },
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          title: new Text("Global Message"),
          subtitle: new Text(
              "Displaying messages from anywhere in the app with BLOC logic"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Example6()),
            );
          },
          trailing: Icon(Icons.arrow_right),
        )
      ],
    );
  }
}
