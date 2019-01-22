import 'package:advanced_flutter_example/ExampleList.dart';
import 'package:advanced_flutter_example/Loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  await GlobalConfiguration().loadFromAsset("app_settings");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Advanced Example',
      home: Home(title: 'Flutter Advanced Examples'),
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
    keywords: <String>['flutter', 'advanced', 'example'],
    contentUrl: 'https://github.com/Ephenodrom/FlutterAdvancedExamples',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender: MobileAdGender.unknown,
    testDevices: <String>[],
  );

  HomeState();

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
          child: ExampleList()
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bool displayAd = GlobalConfiguration().getBool("displayAd");
    if(displayAd) {
      String appId = GlobalConfiguration().getString("appId");
      String adUnitId = GlobalConfiguration().getString("adUnitId");
      FirebaseAdMob.instance.initialize(appId: appId);
      RewardedVideoAd.instance.load(adUnitId: adUnitId, targetingInfo: targetingInfo);
      RewardedVideoAd.instance.listener = listener;
    }else{
      isloaded = true;
    }
  }

  void listener(RewardedVideoAdEvent event, {int rewardAmount, String rewardType}){
    if (event == RewardedVideoAdEvent.rewarded) {

    }else if (event == RewardedVideoAdEvent.loaded) {
      setState(() {
        isloaded = true;
        RewardedVideoAd.instance.show();
      });
    }else if(event == RewardedVideoAdEvent.failedToLoad){
      setState(() {
        isloaded = true;
      });
    }
  }
}