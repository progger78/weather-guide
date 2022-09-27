// Dummy file

import 'dart:convert';

import 'package:bloc_architecture_app/data/models/weather_model.dart';

import 'package:http/http.dart' as http;

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=43ea6baaad7663dc17637e22ee6f78f2');
    try {
      final response = await http.get(url);
      if (response.statusCode < 400) {
        print(jsonDecode(response.body));

        return WeatherModel.fromJson(jsonDecode(response.body)['main']);
      }
    } on Exception catch (e) {
      print(e);
    }

    throw Exception();
  }
}
