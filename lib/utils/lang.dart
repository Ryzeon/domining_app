import 'package:flutter/material.dart';

enum Lang {
  prod(false),
  localUrl("http://localhost:8080/api/v1"),
  backendUrl("https://domining-api.ryzeon.me/api/v1"),
  ;

  final Object value;

  const Lang(this.value);

  String getString() {
    return value as String;
  }

  bool getBool() {
    return value as bool;
  }

  static const  Color primaryColor =  Color(0xFF222831);
  static const  Color secondaryColor =  Color(0xFF31363f);
  static const  Color accentColor =  Color(0xFF76ABAE);
  static const  Color textColor =  Color(0xFFEEEEEE);

  static String getNiceServer() {
    return Lang.prod.getBool() ? Lang.backendUrl.getString() : Lang.localUrl.getString();
  }
}
