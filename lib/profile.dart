import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongo_dart/mongo_dart.dart' as dart_mongo;



var namee;
var dob;
var phone;
var email;
var pass;
var cPass;
var loc;

void main() {
  runApp(profile());


}
class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                Text(
                  'Sujay Deshmukh',
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
                Text(
                    'Unique ID',
                    style:
                    TextStyle( fontSize: 18.0)

                ),
                Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.perm_identity,
                        color: Colors.teal[600],
                      ),
                      title: Text(
                        'Id-MHSG001',
                        style:
                        TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
                Text(
                    'Mobile No.',
                    style:
                    TextStyle( fontSize: 18.0)

                ),
                Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal[600],
                      ),
                      title: Text(
                        '+91 7559486512',
                        style:
                        TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
                Text(
                    'Bate Of Birth :',
                    style:
                    TextStyle( fontSize: 18.0)

                ),
                Card(
                  color: Colors.white,
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.cake,
                      color: Colors.teal[600],
                    ),
                    title: Text(
                      '08-05-1995',
                      style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
                    ),
                  ),
                ),
                Text(
                    'Email id',
                    style:
                    TextStyle( fontSize: 18.0)

                ),
                Card(
                    color: Colors.white,
                    margin:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal[600],
                      ),
                      title: Text(
                        'sujaydeshmukh10@gmail.com',
                        style:
                        TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//void emprofile() async {
//  Db db = new Db("mongodb://10.0.2.2:27017/people");
//  await db.open();
//  DbCollection coll = db.collection("employee");
// var val = await coll.findOne(where.eq("email", email).fields(['name']));
//  print(val);
//}