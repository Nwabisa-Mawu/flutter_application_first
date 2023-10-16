import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather.dart';

// this is a plain class and not a widget
class HttpHelper {
  // connect to the weather API in this class
  // reference url for the code to use the API
  // https://api.openweathermap.org/data/2.5/weather?q=London&appid=ec3e104ffaec5161fbda68312033d111

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'ec3e104ffaec5161fbda68312033d111';

  // method to make the call to the api
  // the Future class is used in DART to perform asynchronous tasks
  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    // the asynchronous call
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}
