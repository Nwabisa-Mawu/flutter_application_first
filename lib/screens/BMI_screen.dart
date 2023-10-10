// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_first/shared/menu_bottom.dart';
import 'package:flutter_application_first/shared/menu_drawer.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Center(child: FlutterLogo()),
    );
  }
}