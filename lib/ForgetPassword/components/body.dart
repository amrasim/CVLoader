import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cvloader/Screens/Login/login_screen.dart';
import 'package:cvloader/Screens/Signup/components/background.dart';
import 'package:cvloader/components/already_have_an_account_acheck.dart';
import 'package:cvloader/components/rounded_button.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  State createState() =>ForgotPassState();


}
TextEditingController emailController= TextEditingController();
class ForgotPassState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "FORGET PASSWORD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Enter Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter an Email Address';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
//            RoundedPasswordField(
//              onChanged: (value) {},
//            ),
            RoundedButton(
              text: "SEND",
              press: () async{
                await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
//            OrDivider(),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                SocalIcon(
//                  iconSrc: "assets/icons/facebook.svg",
//                  press: () {},
//                ),
//                SocalIcon(
//                  iconSrc: "assets/icons/twitter.svg",
//                  press: () {},
//                ),
//                SocalIcon(
//                  iconSrc: "assets/icons/google-plus.svg",
//                  press: () {},
//                ),
//              ],
//            )
          ],
        ),
      ),
    );
  }
}
