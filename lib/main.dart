import 'package:advanced_flutter_example/Loading.dart';
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

  bool isloaded = false;

  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );

  HomeState() {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-6875218797287283~9683625580");
  }

  @override
  Widget build(BuildContext context) {
    if(!isloaded){
      return Loading();
    }
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
            title: new Text("Admob Integration"),
            subtitle: new Text("Integrate Admob in your application."),
            onTap: () {
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
    super.dispose();
  }


  void loadAd() {
    RewardedVideoAd.instance.load(adUnitId: RewardedVideoAd.testAdUnitId, targetingInfo: targetingInfo);
  }

  @override
  void initState() {
    super.initState();
    loadAd();
    RewardedVideoAd.instance.listener = listener;
  }

  void listener(RewardedVideoAdEvent event, {int rewardAmount, String rewardType}){
    if (event == RewardedVideoAdEvent.rewarded) {

    }else if (event == RewardedVideoAdEvent.loaded) {
      setState(() {
        isloaded = true;
        RewardedVideoAd.instance.show();
      });

    }
  }
}