import 'location.dart';
import 'networking.dart';

const apiKey = '19b9d66469630512de0c55ccbe21b42d';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'π©';
    } else if (condition < 400) {
      return 'π§';
    } else if (condition < 600) {
      return 'βοΈ';
    } else if (condition < 700) {
      return 'βοΈ';
    } else if (condition < 800) {
      return 'π«';
    } else if (condition == 800) {
      return 'βοΈ';
    } else if (condition <= 804) {
      return 'βοΈ';
    } else {
      return 'π€·β';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s  A Good Time\nTo Grab Someπ¦';
    } else if (temp > 20) {
      return 'Put on some shorts and\nπ weather\'s good Baby';
    } else if (temp < 10) {
      return "It A Weather For 2\nYou'll need π§£ and π§€";
    } else {
      return 'Better Come Along\nWith a π§₯ just in case';
    }
  }

  String getMood(int temp) {
    if (temp > 25) {
      return 'Warm βοΈ';
    } else if (temp > 20) {
      return 'Very Fantastic π';
    } else if (temp < 10) {
      return "Chilled π©";
    } else {
      return 'Very Wet π§';
    }
  }
}
