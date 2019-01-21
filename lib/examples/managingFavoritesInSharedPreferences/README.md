# Description
This example holds a list of meals. Each meal can be marked as a favorite. The favorite meals will
be stored in the shared preferences.

# Structure
In the Example3.dart file, you will find two lists at the beginning :
```dart
List<String> meals
List<String> favs
```

The list meals contains all meals. The list is filled with strings by hand in the **setUp()** method.
```dart
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
```
The list favs is loaded from the shared preferences in the **initState()** method. It contains all meals,
that are marked as a favorite.
```dart
if(widget.favs.isEmpty){
  SharedPreferences.getInstance().then((prefs){
    widget.favs.addAll(prefs.getStringList("favs"));
    setState((){});
  });
}
```

The list is build with a simple **ListView.builder** in the **build()** method of the state. For each meal
it builds a list tile.
```dart
return ListTile(
  title: new Text(meal),
  trailing: Icon(isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
  onTap: (){
    setState(() {
      addRemFavorite(meal);
    });
  },
);
```

Each ListTile contains an Icon. The method **isFavorite()** is used to determine if the meal is a favorite
or not.
```dart
bool isFavorite(String meal){
  return widget.favs.contains(meal);
}
```

If you tap the tile, the method **addRemFavorite()** is called and adds or removes the meal from
the **favs** list. It also updates the data in the shared preferences.
```dart
void addRemFavorite(String meal) async {
  if(widget.favs.contains(meal)){
    widget.favs.remove(meal);
  }else{
    widget.favs.add(meal);
  }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("favs", widget.favs);
}
```