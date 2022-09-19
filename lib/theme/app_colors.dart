import 'package:flutter/material.dart';
class AppColors{
  static const Color primaryColor =  Color(0xFFF2988C);
  static const Color primaryColorLight =  Color(0xFFFFD1D7);
  static const Color greyTextColor =  Color(0xFFB0B4BB);
  static const Color bgColor =  Color(0xFFFCFCFC);
  static const Color whiteColor =  Color(0xFFFFFFFF);

  static const Color blackColor =  Color(0xFF14142B);


  static MaterialColor primarySwatchColor =
  const MaterialColor(0xFFF2988C, <int, Color>{
    50: Color.fromRGBO(242, 152, 140, .1),
    100: Color.fromRGBO(242, 152, 140, .2),
    200: Color.fromRGBO(242, 152, 140, .3),
    300: Color.fromRGBO(242, 152, 140, .4),
    400: Color.fromRGBO(242, 152, 140, .5),
    500: Color.fromRGBO(242, 152, 140, .6),
    600: Color.fromRGBO(242, 152, 140, .7),
    700: Color.fromRGBO(242, 152, 140, .8),
    800: Color.fromRGBO(242, 152, 140, .9),
    900: Color.fromRGBO(242, 152, 140, 1),
  });
}