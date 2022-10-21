// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.locationWeather});
  final locationWeather;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weather = WeatherModel();

  late int temperature;
  var temp;
  var condition;
  String? cityName;

  String? weathermessage;
  String? todayMood;

  @override
  void initState() {
    super.initState();
    print('helllo');
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    cityName = weatherData['name'];
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    condition = weatherData['weather'][0]['description'];
    weathermessage = weather.getMessage(temperature);
    todayMood = weather.getMood(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Transform.scale(
                          scaleY: 1.3,
                          scaleX: 0.9,
                          child: Image(
                            image: AssetImage('assets/images/emmy.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(width: 14),
                      Text(
                        'Lagos City-NGN',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(54, 66, 77, 1),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.expand_more,
                      )
                    ],
                  ),
                  SizedBox(height: 58),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '$weathermessage',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 22,
                              color: Color.fromRGBO(9, 21, 30, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 70),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(12, 24, 35, 1),
                      radius: 150,
                      child: Stack(
                        children: [
                          Positioned(
                            right: 225,
                            bottom: 200,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/Cloudy_day_icon.png'),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            left: 130,
                            bottom: 20,
                            top: 120,
                            child: Image(
                              image:
                                  AssetImage('assets/images/centercloud.png'),
                            ),
                          ),
                          Positioned(
                            right: 185,
                            bottom: 5,
                            top: 140,
                            child: Image(
                              image: AssetImage('assets/images/windy_icon.png'),
                            ),
                          ),
                          Positioned(
                            bottom: -3,
                            left: 190,
                            top: 120,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/Clear_night_icon.png'),
                            ),
                          ),
                          Positioned(
                            bottom: 210,
                            left: 235,
                            child: Image(
                              image: AssetImage('assets/images/rain_icon.png'),
                            ),
                          ),
                          Positioned(
                            left: 110,
                            top: 255,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/thundersrtom_icon.png'),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Today's like",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "$temperature",
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 43,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    child: Icon(
                                      Icons.circle_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today\'s Mood',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(54, 66, 77, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '$todayMood',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(12, 24, 35, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 35),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tomorrow\'s Mood',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(54, 66, 77, 1),
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Excellent',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(12, 24, 35, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
