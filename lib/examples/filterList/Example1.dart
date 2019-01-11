import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  Example1();

  final String title = "Example1";

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
List<Car> initialList = Car.cars;
  List<Car> currentList = [];

  //filter
  bool selfdriving = false;
  double maxPrice = 100000;

  final controller = new TextEditingController();

  @override
  initState() {
    super.initState();
    controller.addListener(onChange);
    filterCars();
  }

  @override
  Widget build(BuildContext context) {
    filterCars();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(children: [
            Text("Search for your car",style: Theme.of(context).textTheme.headline,),
            TextField(
              controller: controller
            ),
            SwitchListTile(
              title: Text('Selfdriving'),
              value: selfdriving,
              onChanged: (changed){
                setState(() => selfdriving = changed);
              }
            ),
            Slider(
              label: '${maxPrice.round()} \$',
              activeColor: Colors.indigoAccent,
              min: 0.0,
              max: 100000.0,
              divisions: 20,
              onChanged: (newRating) {
                setState(() => maxPrice = newRating);
              },
              value: maxPrice,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: currentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Car current = currentList.elementAt(index);

                    return Card(
                      child: ListTile(
                        title: Text(current.name),
                        subtitle: Text(current.brand),
                        trailing: Text(current.price.toString()+" \$"),
                        leading: Text(current.year),
                      ),
                    );

                  }),
            ),
          ]),
        ));
  }


  onChange() {
    setState((){});
  }

  filterCars() {
    String name = controller.text;
    currentList.clear();
    print("filter cars for name " + name);
    if (name.isEmpty) {
      currentList.addAll(initialList);
    } else {
      for (Car c in initialList) {
        if (c.name.toLowerCase().startsWith(name.toLowerCase())) {
          currentList.add(c);
        }
      }
    }
    print("filter cars for selfdriving " + selfdriving.toString());
    List<Car> tmp = [];
    for (Car c in currentList) {
      if(c.selfDriving == selfdriving){
        tmp.add(c);
      }
    }
    currentList = tmp;
    print("filter cars for max price " + maxPrice.toString());
    tmp = [];
    for (Car c in currentList) {
      if(c.price < maxPrice){
        tmp.add(c);
      }
    }
    currentList = tmp;
  }
}
