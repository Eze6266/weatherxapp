import 'location.dart';
import 'networking.dart';

const apiKey = '19b9d66469630512de0c55ccbe21b42d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s  A Good Time\nTo Grab Some🍦';
    } else if (temp > 20) {
      return 'Put on some shorts and\n👕 weather\'s good Baby';
    } else if (temp < 10) {
      return "It A Weather For 2\nYou'll need 🧣 and 🧤";
    } else {
      return 'Better Come Along\nWith a 🧥 just in case';
    }
  }

  String getMood(int temp) {
    if (temp > 25) {
      return 'Warm ☀️';
    } else if (temp > 20) {
      return 'Very Fantastic 👕';
    } else if (temp < 10) {
      return "Chilled 🌩";
    } else {
      return 'Very Wet 🌧';
    }
  }
}
