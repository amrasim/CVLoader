import 'dart:math';

import 'package:cvloader/Home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String major,university, age,experience,field,fieldValue,field2,fieldValue2;

  const HomeScreen({Key key, this.major, this.university, this.age, this.experience, this.field, this.fieldValue, this.field2, this.fieldValue2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(age: age,university: university,major: major,experience: experience,field:field,fieldValue:fieldValue,field2:field2,fieldValue2:fieldValue2)
    );
  }
}
