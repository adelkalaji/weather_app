import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
// دائما وقت بجيب بيانات من النت بستعملو فاكتوري كونستركتر
// null الهدف منا بترجع اوبجكت وما بتاكل هم القيمة
  factory WeatherModel.fromJson(dynamic data) {
    //(المفتاح منجيبو من الماب داتا يلي فوق)
    //(والمفتاح بنجاب [])
    var jsonData =
        data["forecast"]["forecastday"][0]["day"]; //[0] هي يعني اليوم الاول
    return WeatherModel(
        date: data["location"]["localtime"],
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }
  String getImage() {
    if (weatherStateName == "Sunny") {
      return "assets/images/clear.png";
    } else {
      return "assets/images/snow.png";
    }
  }
   MaterialColor getColor() {
    if (weatherStateName == "Sunny") {
      return Colors.orange;
    } else {
      return Colors.yellow;
    }
  }
}
