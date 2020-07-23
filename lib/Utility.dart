import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'registration.dart';
String photo ;

class Utility {

  static const String IMG_key ='IMAGE_key';
  //save
  static Future<bool> saveImageToPreferences(String value) async{

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(IMG_key, value);
  }
  //get
  static Future<String> getImageFromPreferences() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(IMG_key);
  }
  //convert into base64
  static String base64String(Uint8List data){
    photo= base64Encode(data);
    print("I wnt to : $photo");
    return photo;
  }
  //convert into String
  static Image imageFromBase64String(String base64String){
    return Image.memory(base64Decode(base64String),fit: BoxFit.fill,);
  }

}