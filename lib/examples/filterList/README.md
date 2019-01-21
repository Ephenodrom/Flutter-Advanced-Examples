# Description
A list of cars is filtered by different filters.

# Structure

For filtering a list, we need two lists. The **initialList** is the list that contains all cars. For this
example the list ist setup manually. But it can also be loaded from a different source.
The next important list is the **currentList**. It contains all cars that matches the filters.
```dart
List<Car> initialList = Car.cars;
List<Car> currentList = [];
```

The cars can be filtered with this filters. Each value is controlled by one of the corresponding
```dart
bool selfDriving = false;
double maxPrice = 100000;
String carType = "all";
final controller = new TextEditingController();
```

The method **filterCars()** updates the **currentList** depending on the filters.
```dart
filterCars() {
  // Prepare lists
  List<Car> tmp = [];
  currentList.clear();

  String name = controller.text;
  print("filter cars for name " + name);
  if (name.isEmpty) {
    tmp.addAll(initialList);
  } else {
    for (Car c in initialList) {
      if (c.name.toLowerCase().startsWith(name.toLowerCase())) {
        tmp.add(c);
      }
    }
  }
  currentList = tmp;

  if(selfDriving) {
    tmp = [];
    print("filter cars for selfdriving " + selfDriving.toString());
    for (Car c in currentList) {
      if (c.selfDriving == selfDriving) {
        tmp.add(c);
      }
    }
    currentList = tmp;
  }

  print("filter cars for max price " + maxPrice.toString());
  tmp = [];
  for (Car c in currentList) {
    if(c.price < maxPrice){
      tmp.add(c);
    }
  }
  currentList = tmp;
  if(carType.toLowerCase() != "all") {
    tmp = [];
    print("filter cars for type " + carType);
    for (Car c in currentList) {
      if (c.type == carType.toLowerCase()) {
        tmp.add(c);
      }
    }
    currentList = tmp;
  }
}
```
