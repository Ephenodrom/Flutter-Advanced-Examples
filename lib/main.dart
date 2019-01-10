import 'package:advanced_flutter_example/examples/admobIntegration/Example4.dart';
import 'package:advanced_flutter_example/examples/filterList/Example1.dart';
import 'package:advanced_flutter_example/examples/managingFavoritesInSharedPreferences/Example3.dart';
import 'package:advanced_flutter_example/examples/readingJsonFile/Example2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Advanced Example',
      home: Home(title: 'Flutter Advanced Example'),
    );
  }
}

class Home extends StatefulWidget {
  String title;

  Home({this.title});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  BannerAd _bannerAd;

  HomeState() {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-6875218797287283~9683625580");
  }

  @override
  Widget build(BuildContext context) {
    //loadAd();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: ListView(
        children: [
          ListTile(
            title: new Text("Filtering List"),
            subtitle: new Text("Apply different filters on a list of cars."),
            onTap: () {
              disposeAd();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Example1()),
              );
            },
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: new Text("Json"),
            subtitle: new Text(
                "Loading data from a json file inside the asset folder."),
            onTap: () {
              disposeAd();
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
              disposeAd();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Example3()),
              );
            },
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: new Text("Admob Integration"),
            subtitle: new Text("Integrate Admob in your application."),
            onTap: () {
              disposeAd();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Example4()),
              );
            },
            trailing: Icon(Icons.arrow_right),
          )
        ],
      )),
    );
  }

  @override
  void dispose() {
    disposeAd();
    super.dispose();
  }

  void disposeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }

  void loadAd() {
    if (_bannerAd == null) {
      _bannerAd = BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.banner)
        ..load()
        ..show(
          // Banner Position
          anchorType: AnchorType.bottom,
        );
    } else {
      //_bannerAd.show(anchorType: AnchorType.bottom);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadAd();
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }
}