
import 'package:cvloader/Home/HomeScreen.dart';
import 'package:cvloader/Screens/Signup/signup_screen.dart';
import 'package:cvloader/components/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FactorsScreen extends StatefulWidget {
  const FactorsScreen({
    Key key,
  }) : super(key: key);

  @override
  State createState() =>FactorsScreenState();


}
bool isLoading = false;
TextEditingController majorController = TextEditingController();
TextEditingController experienceController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController universityController = TextEditingController();
TextEditingController selectedController= TextEditingController();
TextEditingController searchingController= TextEditingController();
TextEditingController selected2Controller= TextEditingController();
TextEditingController searching2Controller= TextEditingController();

class FactorsScreenState extends State<FactorsScreen> {
  static final _formKey = GlobalKey<FormState>();

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
      body:  Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Text(
//                  "Matched Factors",
//                  style: TextStyle(fontWeight: FontWeight.bold),
//                ),
                SizedBox(height: size.height * 0.03),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: majorController,
                    decoration: InputDecoration(
                      labelText: "Major",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Your Major';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: experienceController,
                    decoration: InputDecoration(
                      labelText: "Working Experience",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Working Experience';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    decoration: InputDecoration(
                      labelText: "Age",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Age';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: universityController,
                    decoration: InputDecoration(
                      labelText: "University",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter University';
                      }
                      return null;
                    },
                  ),
                ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:TextFormField(
                        controller: searchingController,
                        decoration: InputDecoration(
                          labelText: "Enter Searching Field",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // The validator receives the text that the user has entered.

                      ),
                    ),



                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: selectedController,
                    decoration: InputDecoration(
                      labelText: "Enter Value",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:TextFormField(
                    controller: searching2Controller,
                    decoration: InputDecoration(
                      labelText: "Enter Searching Field",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.

                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: selected2Controller,
                    decoration: InputDecoration(
                      labelText: "Enter Value",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    // The validator receives the text that the user has entered.

                  ),
                ),
                RoundedButton(
                  text: "Submit",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      logInToFb();
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),

              ],
            ),
          ),
        ),
      ),
    );
  }
  void logInToFb() {
      isLoading = false;
      print(ageController.text.trim());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(age:ageController.text.trim(),major: majorController.text.trim(),experience: experienceController.text.trim(),university: universityController.text.trim(),field:searchingController.text.trim(),fieldValue:selectedController.text.trim(),field2:searching2Controller.text.trim(),fieldValue2:selected2Controller.text.trim())),
      );
  }
}
