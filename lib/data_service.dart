import 'dart:convert';
import 'package:havadurumu/weather_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  WeatherModel? object;
  Future<WeatherModel> getWeather(String city) async {
//https:api.openweathermap.org/data/2.5/weather?q=Eskisehir&appid=c29beaf036de18a57fd750997e281b04
    final queryParameters = {
      'q': city,
      'appid': 'c29beaf036de18a57fd750997e281b04',
      "units": "metric"
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    /*print(response.body);*/
    object = WeatherModel.fromJson(jsonDecode(response.body));
    print(object!.name);
    return object!;
  }
}
