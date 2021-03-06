import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '43a5336f18091bc1t8a2d5e4ufef4e7981cff';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'ð©';
    } else if (condition < 400) {
      return 'ð§';
    } else if (condition < 600) {
      return 'âï¸';
    } else if (condition < 700) {
      return 'âï¸';
    } else if (condition < 800) {
      return 'ð«';
    } else if (condition == 800) {
      return 'âï¸';
    } else if (condition <= 804) {
      return 'âï¸';
    } else {
      return 'ð¤·â';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Ã tempo de ð¦ ';
    } else if (temp > 20) {
      return 'Hora de utilizar shorts e ð';
    } else if (temp < 10) {
      return 'VocÃª vai precisar de ð§£ e ð§¤';
    } else {
      return 'Leve um ð§¥ ';
    }
  }
}
