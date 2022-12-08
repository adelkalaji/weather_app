import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart'; //( http key word )

class WeatherService {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "8dbe8d36d6134575ac1175423222611";
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
          "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7"); // (تحويل النص الى رابط)
      http.Response response =
          await http.get(url); //(استلم البيانات يلي جاي من الرابط)
      Map<String, dynamic> data = jsonDecode(response
          .body); //(البيانات يلي جاي نوعا ماب بس بصيغة جيسون ولازم نفك الصيغة)
       weather = WeatherModel.fromJson(data);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return weather;
  }
}
