import 'dart:math';

import 'package:cvloader/Home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String major,university, age,experience;

  const HomeScreen({Key key, this.major, this.university, this.age, this.experience}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(age: age,university: university,major: major,experience: experience,)
    );
  }
}
