
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'CV.dart';


class ShowCVScreen extends StatefulWidget {

  @override
  _ShowCVScreenState createState() {
    return _ShowCVScreenState();
  }
}

class _ShowCVScreenState extends State<ShowCVScreen> {

  List<CV> allData = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CVs'),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Center(child:
        Container(
          height:700,
            child: allData.length == 0
                ? new Text(' No Data is Available')
                : new ListView.builder(

              itemCount: allData.length,
              itemBuilder: (_, index) {
                return UI(
                    allData[index].text,

                );
              },
            )),
        ),

      ),
    );
  }
  var key;
  Map<dynamic, dynamic> map=Map<dynamic, dynamic>();
  @override
  void initState() {
    super.initState();

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child("CVs").once().then((DataSnapshot snap) {
      key=snap.key;
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {

         CV d = new CV(
              data[key]['cv'],

          );
          allData.add(d);
        }



      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }

  Widget UI(String text) {

    return  GestureDetector(

      child: new Card(
        elevation: 10.0,
        child: new Container(
          padding: new EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: [


                  new Text(' $text'),



            ],
          ),

        ),
      ),
    );
  }
}
