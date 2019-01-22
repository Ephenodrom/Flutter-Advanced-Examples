import 'package:advanced_flutter_example/main.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  await GlobalConfiguration().loadFromAsset("env_pro_settings");
  runApp(MyApp());
}
