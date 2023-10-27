

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<File> imageFile;
  File? _image;
  String result = 'Not Classified';
  late ImagePicker imagePicker;


  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 5), () {
    //   setState(() {
    //    
    //   });
    // });
    imagePicker = ImagePicker();
    loadDataModelFiles();
  }

  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false
    );
    print(output);
  }

  doImageClassification() async {
    var recognitions = await Tflite.runModelOnImage(
      path: _image!.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.1,
      asynch: true
    );
    print(recognitions?.length.toString());
    setState(() {
      result = '';
    });
    recognitions?.forEach((element) {
      // setState(() {
      //   print(element.toString());
      //   result += element["label"];
      // });
      result += element["label"] + " " + (element["confidence"] as double).toStringAsFixed(2);
      setState(() {
        result;
      });
    });
  }

  selectPhoto() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null){
      _image = File(pickedFile.path);
    }
    setState(() {
      _image;
      doImageClassification();
    });
  }

  capturePhoto() async {
    XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null){
      _image = File(pickedFile.path);
    }
    setState(() {
      _image;
      doImageClassification();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF65B0B4),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("images/background.jpg"),
          //     fit: BoxFit.cover,
          //   )
          // ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(width: 100,),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Stack(
                    children: [
                      Center(
                        child: TextButton(
                          onPressed: selectPhoto,
                          onLongPress: capturePhoto,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 20, right: 18, left: 18),
                              child: _image != null
                                ? Image.file(
                                _image!,
                                width: 400,
                                height: 400,
                                fit: BoxFit.cover
                              )
                                : SizedBox(
                                  width: 140,
                                height: 190,
                                child: Image.asset('images/cam.png'),
                              ),
                              ),
                          ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '$result',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      backgroundColor: Colors.white60
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
