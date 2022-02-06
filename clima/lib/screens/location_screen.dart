import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

const apiKey = '450804a4755996b32ba93f75175bcd93';
const urlprefix = 'https://api.openweathermap.org/data/2.5/weather';

class LocationScreen extends StatefulWidget {
  const LocationScreen({this.locationWeather});

  final locationWeather; // dohvacena json varijabla

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature = 0;
  String conditionEmoji = 'Error';
  String description = 'Unable to get weather data.';
  final weather = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateWeatherDate(widget.locationWeather);
  }

  void updateWeatherDate(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        description = 'Unable to get weather data.';
        conditionEmoji = 'Error';
        return;
      }
      // temp
      temperature = weatherData['main']['temp'].toInt();

      // condition emoji
      int condition = weatherData['weather'][0]['id'];
      conditionEmoji = weather.getWeatherIcon(condition);

      // description
      String city = weatherData['name'];
      String message = weather.getMessage(temperature);
      description = '$message in $city';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationData();
                      updateWeatherDate(weatherData);
                    },
                    child: const Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedCityName != null) {
                        var weatherData =
                            await weather.getCityData(typedCityName);
                        updateWeatherDate(weatherData);
                      }
                    },
                    child: const Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(conditionEmoji, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  description,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
