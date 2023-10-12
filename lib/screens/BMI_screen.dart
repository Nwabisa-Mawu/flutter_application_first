// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_first/shared/menu_bottom.dart';
import 'package:flutter_application_first/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  // state variable to hold the result
  String result = '';

  // Boolean va to hold the state of the chosen system
  bool isMetric = true;
  bool isImperial = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Text('BMI Calculator'),
      )),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Center(child: FlutterLogo()),
    );
  }
}
