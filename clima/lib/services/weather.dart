import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '450804a4755996b32ba93f75175bcd93';
const urlprefix = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityData(String cityName) async {
    String hiperlink = '$urlprefix?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper net = NetworkHelper(hiperlink);
    var weatherData = await net.getHTTPData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Locator l = Locator();
    await l.getCurrentLocation();

    String hiperlink =
        '$urlprefix?lat=${l.latitude}&lon=${l.longitude}&appid=$apiKey&units=metric';
    NetworkHelper net = NetworkHelper(hiperlink);
    var weatherData = await net.getHTTPData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
