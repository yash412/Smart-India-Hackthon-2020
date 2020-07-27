import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Utility.dart';
import 'registration.dart';



Image imageFromPreferences;
class SaveImageDemo extends StatefulWidget {
  SaveImageDemo() : super();

  final String title = "Flutter Save Image in Preferences";

  @override
  SaveImageDemoState createState() => SaveImageDemoState();


}

class SaveImageDemoState extends State<SaveImageDemo> {
  //
  Future<File> imageFile;


  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  loadImageFromPreferences() {
    Utility.getImageFromPreferences().then((outImg) {
      if (null == outImg) {
        return;
      }
      setState(() {
        imageFromPreferences = Utility.imageFromBase64String(outImg);

      });
    });
  }

  Widget imageFromGallery() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          //print(snapshot.data.path);
          Utility.saveImageToPreferences(
              Utility.base64String(snapshot.data.readAsBytesSync()));
          return Image.file(
            snapshot.data,
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'Click on + button for taking image',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery(ImageSource.camera);
              setState(() {
                imageFromPreferences = null;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              loadImageFromPreferences();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              imageFromGallery(),
              SizedBox(
                height: 20.0,
              ),
              null == imageFromPreferences ? Container() : imageFromPreferences,
            ],
          ),
        ),
      ),
    );
  }
}
