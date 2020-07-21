import 'dart:io';
import 'dart:async';

import 'package:SmartIndiaHackthon2020/registration.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:SmartIndiaHackthon2020/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyAppState(),
      ),
    );
  }
}

class MyAppState extends StatelessWidget {
  File image;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
//    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome $name',
              textScaleFactor: 1.5,
            ),
          ),
          body: Center(
            child: new Container(
              child: new Center(
                  child: Column(children: <Widget>[
                    Text(
                      'Ministry of Youth Affairs and Sports > Maharashtra > Shegaon ',
                      style: TextStyle(fontSize: 16),
                    ),
                    RaisedButton(
                        child: Text('Mark Attendance'),
                        color: Colors.green,
                        splashColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))),
                        onPressed: () {
                          picker();
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>TakePictureScreen( camera: picker(),)));
                        }),
                    RaisedButton(
                      child: Text('Profile'),
                      color: Colors.green,
                      splashColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>profile()));

                      },
                    ),
                    RaisedButton(
                      child: Text('Request Permission'),
                      color: Colors.green,
                      splashColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {

                      },
                    ),
                    RaisedButton(
                      child: Text('History'),
                      color: Colors.green,
                      splashColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {

                      },
                    ),
                  ])),
            ),
          )),
    );
  }
}
