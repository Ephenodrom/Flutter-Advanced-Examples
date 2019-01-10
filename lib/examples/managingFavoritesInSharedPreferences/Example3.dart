import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Example3 extends StatefulWidget {
  Example3(){
   setUp();
  }

  final String title = "Example3";
  final List<String> meals = new List();
  final List<String> favs = new List();

  void setUp() {
    meals.add("Pizza");
    meals.add("Spaghetti");
    meals.add("Lasagne");
    meals.add("Steak");
    meals.add("French Fries");
    meals.add("Mac & Cheese");
    meals.add("Schnitzel");
    meals.add("Brezel");
  }

  @override
  _Example3State createState() => _Example3State();
}

class _Example3State extends State<Example3> {

  @override
  initState() {
    super.initState();
    if(widget.favs.isEmpty){
      SharedPreferences.getInstance().then((prefs){
        widget.favs.addAll(prefs.getStringList("favs"));
        setState((){});
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
            // Let the ListView know how many items it needs to build
            itemCount: widget.meals.length,
            // Provide a builder function. 
            itemBuilder: (context, index) {
              String meal = widget.meals[index];
              return ListTile(
                title: new Text(meal),
                trailing: Icon(isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
                onTap: (){
                  setState(() {
                    addRemFavorite(meal);
                  });
                },
              );
            }),
      ),
    );
  }

  bool isFavorite(String meal){
    return widget.favs.contains(meal);
  }

  void addRemFavorite(String meal) async {
    if(widget.favs.contains(meal)){
      widget.favs.remove(meal);
    }else{
      widget.favs.add(meal);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("favs", widget.favs);

  }
}
