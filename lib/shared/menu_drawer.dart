// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

// place the page nav here because the change tab is in the drawer

import 'package:flutter/material.dart';
import '../screens/bmi_screen.dart';
import '../screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Listview contains a scrollable list of widgets
      child: ListView(
          // the context is the same as the one in the class declaration when the build method gets called
          children: buildMenuItems(context)),
    );
  }

  // create a new method to build the menu items in the drawer that will return a list
  // the <widget> is the state the data type of the things in our list
  List<Widget> buildMenuItems(BuildContext context) {
    // we declare the list variable with final keyword because we will not need to change it during the app's lifetime
    // will iterate through this list to create menu items
    final List<String> menuTitles = [
      'Home',
      'BMI Calculator',
      'Weather',
      'Training'
    ];

    // declare a mutable variable then use the add method to add new items to the list that will show in the drawer
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Center(
        child: Text('Globo Fitness',
            style: TextStyle(color: Colors.white, fontSize: 28)),
      ),
    ));

    menuTitles.forEach((String element) {
      // create a widget for page navigation
      Widget screen = Container();
      // ListTile is a widget with a fixed height that can contain some text and icons
      menuItems.add(ListTile(
          // the element represents a single string from the list we are iterating.
          // the onTap parameter will contain the code for navigating to other pages
          title: Text(element, style: TextStyle(fontSize: 18)),
          // use a switch statement to tell it to go to which page when a certain menu item is clicked
          // This is the unNamed routes method for navigation
          onTap: () {
            switch (element) {
              case 'Home':
                screen = IntroScreen();
                break;
              case 'BMI Calculator':
                screen = BmiScreen();
                break;
            }

            // to remove the drawer on back navigation
            Navigator.of(context).pop();
            // To actually navigate to another screen and use its push and pop methods
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    // this method returns the items for our drawer
    return menuItems;
  }
}
