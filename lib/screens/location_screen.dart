import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilits/constants.dart';


class LocationScreen extends StatefulWidget {
  LocationScreen(this.weatherData);

  final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temp;
  String? name;
  String? weatherIcon;
  String? message;

  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateWeather(widget.weatherData);
  }

  void updateWeather(dynamic weatherData) {
    setState(() {
      if(weatherData == null){
        temp = 0;
        name = '';
        weatherIcon = '';
        message = 'unable to get weather data';
        return;
      }
      int id = weatherData['weather'][0]['id'];
      double temperature = weatherData['main']['temp'];
      temp = temperature.toInt();
      name = weatherData['name'];
      weatherIcon = weatherModel.getWeatherIcon(id);
      message = weatherModel.getMessage(temp!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop)),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                        var weatherData = await weatherModel.getLocationWeather();
                        updateWeather(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      String cityName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      if (cityName != null){
                        var newDataCity = await weatherModel.getCityWeather(cityName);
                        updateWeather(newDataCity);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon ',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text("$message in $name!",
                    textAlign: TextAlign.right, style: kMessageTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
