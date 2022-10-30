import 'package:flutter/material.dart';
class ColorManager{
  static Color darkSkyBlue = HexColor.fromHex('#81c3d7');
  static Color indigoDye = HexColor.fromHex('#16425B');
  static Color gainsboro = HexColor.fromHex('#d9dcd6');
  static Color darkBlueGrey = HexColor.fromHex('#5E648B');
  static Color twilightLavender = HexColor.fromHex('#824c71');
  static Color bittersweet = HexColor.fromHex('#FF6B6B');
  static Color russianGreen = HexColor.fromHex('#629460');
  static Color darkPurple = HexColor.fromHex('#23001e');
  static Color grannySmithApple = HexColor.fromHex('#BEEF9E');
  
  static Color secGradient1 = HexColor.fromHex('#E0C1B3');
  static Color secGradient2 = HexColor.fromHex('#FAFF7F');

  static Color minGradient1 = HexColor.fromHex('#795663');
  static Color minGradient2 = HexColor.fromHex('#E08D79');

  static Color hourGradient1 = HexColor.fromHex('#F29559');
  static Color hourGradient2 = HexColor.fromHex('#ED254E');

}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }

}