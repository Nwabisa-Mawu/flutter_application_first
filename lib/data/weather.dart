// ignore_for_file: unnecessary_this

class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  // create a constructyor that fills the fields when called.
  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    this.name = weatherMap['name'] ?? '';
    // add the formula to show the temperature in fahrenheit
    // this.temperature = (weatherMap['main']['temp'] * (9/5) - 459.67) ?? 0;
    // add the formula to show the temperature in celsius
    this.temperature = (weatherMap['main']['temp'] - 273.15) ?? 0;
    this.perceived = (weatherMap['main']['feels_like'] - 273.15) ?? 0;
    this.pressure = weatherMap['main']['pressure'] ?? 0;
    this.humidity = weatherMap['main']['humidity'] ?? 0;
    this.description = weatherMap['weather'][0]['main'] ?? '';
  }
}
