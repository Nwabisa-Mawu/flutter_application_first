// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

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
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight), label: 'BMI'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_martial_arts), label: 'Train')
      ],
    );
  }
}
