// dart library
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// package that has widgets from material design
import 'package:flutter/material.dart';
import 'package:flutter_application_first/screens/bmi_screen.dart';
// Always have to import when you want use pieces of code outside of the file you're working in.
import 'package:flutter_application_first/screens/intro_screen.dart';

// entry point for the app is the main method, 
void main() {
  runApp(const GlobeApp()); //the runApp method inflates a widget and attaches it to the screen - GlobeApp is the first widget we created
}

// the main app interface that will show on the app
class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  // use the build method to add the widgets that should be in the app
  // every widget that extends the stateless widget must override the build method
  @override
  Widget build(BuildContext context) {
    // this means return a new instance of MaterialApp method which is the main container for apps that use material design.
    // this is where we will place all the widgets to be seen
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      // add the routes parameter which is key-value paired object
      // the keys are strings with the route names, the values are builders.
      // these route names will be used in the bottom nav widget to set the page routes - this is the namedRoute method of navigation
      routes: {
        './': (context) => IntroScreen(),
        '/bmi':(context) => BmiScreen(),
      },
        // initialRoute: '/', - not setting the initial route because not required as I have a homepage set up
        // this is code for the home page of the app
        home: IntroScreen());
  }
}
