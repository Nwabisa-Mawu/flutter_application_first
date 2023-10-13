import 'package:flutter/material.dart';
import '../data/http_helper.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: getData,
            child: Text('Get Data'),
            ),
          Text(result),
        ],
      ),
    );
  }
}
