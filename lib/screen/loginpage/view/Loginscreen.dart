import 'package:flutter/material.dart';

import '../../../utils/shared_pref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextField(
              //   controller: txtemail,
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              //       prefixIcon: Icon(Icons.email),
              //       hintText: "Enter your email",hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              //     ),
              // ),
              // SizedBox(height: 25,),
              // TextField(
              //   controller: txtpassword,
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              //
              //     prefixIcon: Icon(Icons.lock),
              //
              //     hintText: "Enter your Password",hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
              //   ),
              // ),
              // ElevatedButton(onPressed: () {
              //
              // }, child: Text("Login"),style: ButtonStyle()),
              TextField(
                controller: txtemail,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(),
                  hintText: 'enter your email',
                  hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.email,color: Colors.grey),
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: txtpassword,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.lock,color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String userEmail = txtemail.text;
                  String userpassword = txtpassword.text;
                  Shr shr = Shr();
                  Map m1 = await shr.readShr();
                  if (userEmail == m1['e1'] && userpassword == m1['p1']) {
                    Navigator.pushReplacementNamed(context, 'iud');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid Data"),
                      ),
                    );
                  }
                },
                child: Text("Log In"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'singup');
                },
                child: Text("Create an Account? Sign Up",
                    style: TextStyle(color: Colors.cyanAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
