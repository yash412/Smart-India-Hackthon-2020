import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final TextEditingController _pass = TextEditingController();
final TextEditingController _confirmPass = TextEditingController();
String _email;
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  var _offices = ['',
    'xyz,bhuldana,Maharashtra',
    'lmn,akola,Maharashtra',
    'stu,akola,Maharashtra',
    'abc,ernakulam,Kerala',
    'uvw,kucci,Assam',
    'pqr,jabalpur,Madhaya pradesh'];
  var _currentItemSelected = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Registration form'),

      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth',
                      labelText: 'Dob',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),


                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) =>
                    !val.contains('@') ? 'Invalid Email' : null,
                    onSaved: (val) => _email = val,
                  ),

                  new TextFormField(
                    controller: _pass,

                    decoration: const InputDecoration(
                      icon: const Icon(Icons.add_circle_outline),
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),

                  new TextFormField(
                    controller: _confirmPass,
                    validator: (val){

                      if (val !=_pass.text)
                        return'Not Match';
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.add_circle_outline),
                      hintText: 'Confirm password',
                      labelText: 'Confirm password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),

                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.add_location),
                      hintText: 'Enter your office location',
                      labelText: 'Office location',
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only( top: 40.0),
                    width: 250.0,
                    height: 85.0,

                    child: new RaisedButton(
                        child: Text('Add Faces'),

                        onPressed: (){

                        }),
                  ),


                  new Container(
                    padding: const EdgeInsets.only( top: 40.0),
                    width: 250.0,
                    height: 85.0,

                    child: new RaisedButton(
                        color: Colors.red,
                        child:  Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 20.0,
                              color:Colors.white,
                              fontFamily:'Raleway',
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        elevation: 9.0,
                        onPressed: () => bookFlight(context)
                    ),
                  ),


                ],
              ))),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Form submitted successfully!"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog
    );
  }
}


