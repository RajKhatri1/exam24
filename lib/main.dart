import 'package:exam24/screen/HomePage/view/homescreen.dart';
import 'package:exam24/screen/apicalling/provider/apiprovider.dart';
import 'package:exam24/screen/apicalling/view/apicallingpage.dart';
import 'package:exam24/screen/loginpage/view/Loginscreen.dart';
import 'package:exam24/screen/patternpage/view/patternscreen.dart';
import 'package:exam24/screen/singuppage/singupscreen.dart';
import 'package:exam24/screen/todopage/provider/todoprovider.dart';
import 'package:exam24/screen/todopage/view/todoscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => apiprovider(),),
        ChangeNotifierProvider(create: (context) => todoprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => LoginScreen(),
          'pattern' : (context) => patternscreen(),
          'iud' : (context) => todoscreen(),
          'api' : (context) => ApiScreen(),
          'login' : (context) => LoginScreen(),
          'singup' : (context) => singupscreen(),
        },
      ),
    )
  );
}

