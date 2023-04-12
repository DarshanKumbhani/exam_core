import 'package:exam_core/screens/Home_screen.dart';
import 'package:exam_core/splsh/spalsh_screen.dart';
import 'package:flutter/material.dart';

import 'screens/add_contact.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
     routes:{
       '/':(context) => Home_screen(),
       'spash':(context) => Splash_(),
       'add':(context) => Add_Contact(),

     },
    ),
  );
}

