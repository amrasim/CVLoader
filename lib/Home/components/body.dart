import 'package:cvloader/Screens/Login/login_screen.dart';
import 'package:cvloader/Screens/Signup/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cvloader/Screens/Login/components/background.dart';

import '../../constants.dart';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'dart:async';

import 'package:pdf_text/pdf_text.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Body> {
  PDFDoc _pdfDoc;
  String _text = "";

  bool _buttonsEnabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
        title: Text("Home"),
    actions: <Widget>[
    IconButton(
    icon: Icon(
    Icons.exit_to_app,
    color: Colors.white,
    ),
    onPressed: () {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut().then((res) {
    Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => SignUpScreen()),
    (Route<dynamic> route) => false);
    });
    },
    )
    ],
    ),
    body:

    Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(10),
    child: ListView(
    children: <Widget>[
    Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: size.width * 0.8,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(29),
    child: FlatButton(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    color: kPrimaryColor,
    onPressed: (){
    _pickPDFText();
    },
    child: Text(
    "Pick PDF document",
    style: TextStyle(color: Colors.white),
    ),
    ),
    ),
    ),

    Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: size.width * 0.8,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(29),
    child: FlatButton(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    color: kPrimaryColor,
    onPressed: (){
    _buttonsEnabled ? _readRandomPage():{};
    },
    child: Text(
    "Read random page",
    style: TextStyle(color: Colors.white),
    ),
    ),
    ),
    ),

    Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: size.width * 0.8,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(29),
    child: FlatButton(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    color: kPrimaryColor,
    onPressed: (){
    _buttonsEnabled ? _readWholeDoc() : () {};
    },
    child: Text(
    "Read whole document",
    style: TextStyle(color: Colors.white),
    ),
    ),
    ),
    ),
    Padding(
    child: Text(
    _pdfDoc == null
    ? "Pick a new PDF document and wait for it to load..."
        : "PDF document loaded, ${_pdfDoc.length} pages\n",
    style: TextStyle(fontSize: 18),
    textAlign: TextAlign.center,
    ),
    padding: EdgeInsets.all(15),
    ),
    Padding(
    child: Text(
    _text == "" ? "" : "Text:",
    style: TextStyle(fontSize: 18),
    textAlign: TextAlign.center,
    ),
    padding: EdgeInsets.all(15),
    ),
    Text(_text),
    ],
    ),
    ));
  }

  /// Picks a new PDF document from the device
  Future _pickPDFText() async {
    var filePickerResult = await FilePicker.getFile(type: FileType.custom, allowedExtensions: ['pdf']);;
    if (filePickerResult != null) {
      _pdfDoc = await PDFDoc.fromPath(filePickerResult.path);
      setState(() {
//        _pdfDoc.text
      });
    }
  }

  /// Reads a random page of the document
  Future _readRandomPage() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text =
    await _pdfDoc.pageAt(Random().nextInt(_pdfDoc.length) + 1).text;

    setState(() {
      _text = text;
      _buttonsEnabled = true;
    });
  }

  /// Reads the whole document
  Future _readWholeDoc() async {
    if (_pdfDoc == null) {
      return;
    }
    setState(() {
      _buttonsEnabled = false;
    });

    String text = await _pdfDoc.text;

    setState(() {
      _text = text;
      _buttonsEnabled = true;
    });
  }
}
