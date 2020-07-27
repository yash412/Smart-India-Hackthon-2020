import 'package:SmartIndiaHackthon2020/logins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;
import 'image_save.dart';
import 'Utility.dart';

var empName;
var empDob;
var empPhone;
var empEmail;
var empLoc;
var empimg;
void main() {
  runApp(profile());
}

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var _imageFile;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile ",
            style: TextStyle(fontSize: 18.0),
            textScaleFactor: 1.5,
            textAlign: TextAlign.justify,
          ),
        ),
        backgroundColor: Colors.blue[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: 250.0,
                    child: Utility.imageFromBase64String(empimg),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    '$empName',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSansPro',
                      color: Colors.red[400],
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 200,
                    child: Divider(
                      color: Colors.teal[100],
                    ),
                  ),
                  Text('Email id', style: TextStyle(fontSize: 18.0)),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal[600],
                        ),
                        title: Text(
                          '$empEmail',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                  Text('Mobile No.', style: TextStyle(fontSize: 18.0)),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal[600],
                        ),
                        title: Text(
                          '+91 $empPhone',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                  Text('Date Of Birth :', style: TextStyle(fontSize: 18.0)),
                  Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.cake,
                        color: Colors.teal[600],
                      ),
                      title: Text(
                        '$empDob',
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontFamily: 'Neucha', fontSize: 20.0),
                      ),
                    ),
                  ),
                  Text('Location', style: TextStyle(fontSize: 18.0)),
                  Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.teal[600],
                        ),
                        title: Text(
                          '$empLoc',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontFamily: 'BalooBhai', fontSize: 20.0),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
