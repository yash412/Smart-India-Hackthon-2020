import 'package:flutter/material.dart';
void main()=> runApp(History());
class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HistoryEmp(),
      ),
    );
  }
}
class HistoryEmp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
      title: Text(
      'History of Attendance',
      textScaleFactor: 1.5,
    ),
    )
        body:Cen ,
      ));
  }
}
