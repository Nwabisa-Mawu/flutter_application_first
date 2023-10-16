// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

// this override only applied to stateless widgets.
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // add onTap method for the navigation rules for the bottom navbar
      onTap: (int index) {
        // the index is the index number of the bottomnav item
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/bmi');
            break;
            case 2:
            Navigator.pushNamed(context, '/train');
            break;
        }
      },
      // these are the navigation items found in the bottom nav
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_martial_arts), label: 'Train')
      ],
    );
  }
}
