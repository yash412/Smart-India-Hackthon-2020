import 'logins.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Form Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new LoginState()
    );
  }
}