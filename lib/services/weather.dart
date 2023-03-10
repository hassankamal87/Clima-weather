import 'location.dart';
import 'networking.dart';

const apiKey = 'f09ae20fed8ab1560119cb06d1ad56ed';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
  LocationServices locationServices = LocationServices();
  await locationServices.getCurrentLocation();

  NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?'
      'lat=${locationServices.latitude}&'
      'lon=${locationServices.latitude}&'
      'appid=$apiKey&units=metric');
  var weatherData = await networkHelper.getData();
  return weatherData;
}
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ';
    } else if (condition < 700) {
      return 'โ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ';
    } else if (condition <= 804) {
      return 'โ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 22) {
      return 'Time for shorts and ๐';
    }else if(temp > 10){
      return 'Wear a ๐งฅ just in case';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}