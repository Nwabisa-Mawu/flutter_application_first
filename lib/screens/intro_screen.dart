// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the appbar gives you the top navigation tab for mobile home page
      appBar: AppBar(title: const Text('Globo Fitness')),
      // this is where you put the body content of the home page
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/beach.jpg'),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white60,
          ),
          child: Text(
            'Commit to be fit, dare to be great \n with Globo Fitness.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, shadows: [
              Shadow(
                  offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.grey)
            ]),
          ),
        )),
      ),
    );
  }
}
