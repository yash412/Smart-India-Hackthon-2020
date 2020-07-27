import 'package:SmartIndiaHackthon2020/profile.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import './registration.dart';
import './image_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;
import 'package:mongo_dart_query/mongo_aggregation.dart';
import 'profile_page.dart';

var Logemail;
var Logpass;
var logemploy;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginState(),
  ));
}

class LoginState extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Ministry Of Youth Affairs & Sports',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'images/Sports.png'),

                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onChanged: (text) {
                      print("First text field: $text");
                      Logemail = text;

                      print(Logemail);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (text) {
                      print("First text field: $text");
                      Logpass = text;

                      print(Logpass);
                    },
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text(
                        'Login',
                        textScaleFactor: 1.4,
                      ),
                      onPressed: () {
                        login();
                        emprofile();
                        if (null == logemploy) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Invalid Email or Password"),
                                );
                              });
                        }else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyAppState()));
                        }


                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registration()));
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }

  void login() async {
    Db db = new Db("mongodb://10.0.2.2:27017/worker");
    await db.open();
    DbCollection coll = db.collection("employee");
    var employ = await coll.findOne({
      r'$and': [
        {"email": Logemail},
        {"password": Logpass}
      ]
    });
    logemploy = employ;
  }
}

// this method is used in profile.dart file.

emprofile() async {
  Db db = new Db("mongodb://10.0.2.2:27017/worker");
  await db.open();
  print('connected to database');
  DbCollection coll = db.collection("employee");

  var dictValue0 = await coll
      .find(where.match("email", Logemail).excludeFields([
    "_id",
    "password",
    "imgString",
    "cPass",
    "location",
    "email",
    "phone",
    "dob"
  ]))
      .toList();
  var arrayEle0 = dictValue0[0];

  empName = arrayEle0['name'];
  print(empName);

  var dictValue1 = await coll
      .find(where.match("email", Logemail).excludeFields([
    "_id",
    "password",
    "imgString",
    "cPass",
    "location",
    "name",
    "phone",
    "dob"
  ]))
      .toList();
  var arrayEle1 = dictValue1[0];
  empEmail = arrayEle1['email'];
  print(empEmail);

  var dictValue2 = await coll
      .find(where.match("email", Logemail).excludeFields([
    "_id",
    "password",
    "imgString",
    "cPass",
    "location",
    "name",
    "email",
    "dob"
  ]))
      .toList();
  var arrayEle2 = dictValue2[0];
  empPhone = arrayEle2['phone'];
  print(empPhone);

  var dictValue3 = await coll
      .find(where.match("email", Logemail).excludeFields([
    "_id",
    "password",
    "imgString",
    "cPass",
    "location",
    "name",
    "email",
    "phone"
  ]))
      .toList();
  var arrayEle3 = dictValue3[0];
  empDob = arrayEle3['dob'];
  print(empDob);

  var dictValue4 = await coll
      .find(where.match("email", Logemail).excludeFields([
    "_id",
    "password",
    "imgString",
    "cPass",
    "dob",
    "name",
    "email",
    "phone"
  ]))
      .toList();
  var arrayEle4 = dictValue4[0];
  empLoc = arrayEle4['location'];
  print(empLoc);

  var dictValue5 = await coll
      .find(where.match("email", Logemail).excludeFields([
    "_id",
    "password",
    "location",
    "cPass",
    "dob",
    "name",
    "email",
    "phone"
  ]))
      .toList();
  var arrayEle5 = dictValue5[0];
  empimg = arrayEle5['imgString'];
  print(empimg);

  await db.close();
}
