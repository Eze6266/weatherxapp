// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:page_animation_transition/animations/bottom_to_top_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:weather_app/homepage.dart';
import 'package:weather_app/loading_screen.dart';
import 'package:weather_app/networking.dart';
import 'location.dart';

const apiKey = '8a1447f5229047fde08b2eb5341f193c';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        primary: false,
        actions: [
          Image(
            image: AssetImage('assets/images/star.png'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " Let's See The",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                      color: Color.fromRGBO(12, 24, 35, 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weather",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                          color: Color.fromRGBO(12, 24, 35, 1),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 60,
                    ),
                  ],
                ),
                Text(
                  "Around You",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                      color: Color.fromRGBO(12, 24, 35, 1),
                    ),
                  ),
                ),
                SizedBox(height: 173),
                Padding(
                  padding: const EdgeInsets.only(bottom: 77),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const LoadingScreen(),
                          pageAnimationType: BottomToTopTransition()));
                    },
                    child: Container(
                      height: 62,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(12, 24, 35, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "LET'S CHECK",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color.fromRGBO(252, 252, 252, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
