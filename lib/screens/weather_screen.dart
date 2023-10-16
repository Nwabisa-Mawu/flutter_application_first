// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../data/http_helper.dart';
import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result = Weather('', '', 0, 0, 0, 0);
  final TextEditingController txtPlace = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                  controller: txtPlace,
                  decoration: InputDecoration(
                    hintText: 'Enter a city',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: getData,
                    ),
                  )),
            ),
            weatherRow('Place:', result.name),
            weatherRow('Description:', result.description),
            weatherRow('Temperature:', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived:', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure:', result.pressure.toString()),
            weatherRow('Humidity:', result.humidity.toString())
          ],
        ),
      ),
    );
  }

  // the get data method to fetch the weather data
  Future getData() async {
    // declare httphelper instance
    HttpHelper helper = HttpHelper();
    // fetch the result
    result = await helper.getWeather(txtPlace.text);

    setState(() {});
  }

  // create a method that returns a widget
  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).hintColor),
                )),
            Expanded(
                flex: 4,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor),
                ))
          ],
        ));
    return row;
  }
}
