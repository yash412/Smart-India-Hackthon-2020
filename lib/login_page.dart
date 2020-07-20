import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import './registration.dart';
import './image_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;
import 'package:mongo_dart_query/mongo_aggregation.dart';
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
                    onSubmitted: (text) {
                      print("First text field: $text");
                      Logemail=text;

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
                    onSubmitted: (text) {
                      print("First text field: $text");
                      Logpass=text;

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
                        if (logemploy == null){
                          print("Invalid Email or password");
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
                            Navigator.push(context, MaterialPageRoute(
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
    Db db = new Db("mongodb://10.0.2.2:27017/people");
    await db.open();
    DbCollection coll = db.collection("employee");
    var employ = await coll.findOne({ r'$and': [ { "email": Logemail}, { "password": Logpass}]});
    logemploy=employ;

    print(employ);
  }

//  class SportsImageAsset extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//  AssetImage assetImage =AssetImage('images/Sports.png');
//  Image image = Image(image: assetImage, width: 200.0, height: 200.0,);
//  return Container(child: image,);
//
//  }
//  }
}