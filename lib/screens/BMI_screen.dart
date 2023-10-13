// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_first/shared/menu_bottom.dart';
import 'package:flutter_application_first/shared/menu_drawer.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

// The createState() method returns an instance of the BmiScreenState
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();

// the font size for the toggle
  final double fontSize = 18;

// state variable to hold the result
  String result = '';

// Boolean va to hold the state of the chosen system
  bool isMetric = true;
  bool isImperial = false;

// variables to hold the value of the height and weight
// the ? are so that the data type of these variables can be either double or maybe an integer depending on the user input. This is also because the initial value of the of variable is not stated so the type cannot be inferred.
  double? height;
  double? weight;

  // list of booloeans for the number system toggle
  // the late keyword lets flutter know that the value will be set later
  late List<bool> isSelected;

  // placeholder text for the input fields
  String heightMsg = '';
  String weightMsg = '';

  // init method for the system toggle
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMsg =
        'Please insert your height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMsg = 'Please insert your weight in ${(isMetric) ? 'kg' : 'lbs'}';
    return Scaffold(
      appBar: AppBar(
          title: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Text('BMI Calculator'),
      )),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: SingleChildScrollView(
        child: Column(children: [
          // changing system toggle
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ToggleButtons(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Metric', style: TextStyle(fontSize: fontSize)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text('Imperial', style: TextStyle(fontSize: fontSize)),
              ),
            ], isSelected: isSelected, onPressed: toggleMeasure),
          ),
          // this is the textfield for the number input.
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: txtHeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: heightMsg),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: txtWeight,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: weightMsg),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
                onPressed: findBMI,
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(fontSize: fontSize),
                )),
          ),
          Text(
            result,
            style: TextStyle(fontSize: fontSize),
          ),
        ]),
      ),
    );
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  }

  // method for the calculation of the BMI that will return void
  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;

    if (isMetric) {
      bmi = weight / (height * height);
    } else {
      bmi = weight * 703 / (height * height);
    }

  // show the result in the UI
    setState(() {
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }

  

}
