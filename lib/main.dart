import 'package:flutter/material.dart';
import 'package:gis_tahura_nuraksa_mobile_flutter/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "TAHURA Nuraksa",
      home: Home(),
    );
  }
}




