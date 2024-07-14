import 'package:flutter/material.dart';
abstract class AppTheme {

  static Color get  mainColor => Color(0xff004182);
  static Color get  textColor => Color(0xff06004F);


  static  TextStyle titleStyle =  TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textColor);
  static  TextStyle priceStyle =  TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textColor);
  static  TextStyle reviewStyle =  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: mainColor);
  static  TextStyle hintStyle =  TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color:textColor);
  static  TextStyle DisPriceStyle =  TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color:mainColor,
      decoration: TextDecoration.lineThrough);

static ThemeData theme = ThemeData(
    primaryColor: mainColor,
  hintColor: textColor,
  textTheme: TextTheme(
    headline1: titleStyle,
    headline2: priceStyle,
    headline3: reviewStyle,
    headline4: hintStyle,
    headline5: DisPriceStyle,
  ),

);

}
