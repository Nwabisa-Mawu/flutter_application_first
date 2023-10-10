// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_first/shared/menu_bottom.dart';
import 'package:flutter_application_first/shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // the appbar gives you the top navigation tab for mobile home page
      appBar: AppBar(title: Center(child: const Text('Globo Fitness'))),

      // this is where you place the menu drawer
      drawer: MenuDrawer(),

      // Bottom navbar
      bottomNavigationBar: MenuBottom(),

      // this is where you put the body content of the home page
      // this is the container for the whole body
      body: Container(
        // these are the styles for the whole body container with a background image
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/beach.jpg'),
          fit: BoxFit.cover,
        )),
        // this is the start of the textbox inside the body container and it is centered
        child: Center(
            child: Container(
              // styling for the textbox container
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white60,
          ),
          // the text child
          child: Text(
            'Commit to be fit, dare to be great \n with Globo Fitness.',
            // styling for the text with box shadow effect on text.
            textAlign: TextAlign.center,
            // in the Textstyle method we put all the styles for the text specifically.
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
