import 'package:flutter/material.dart';

import '../../utils/shared_pref.dart';

class singupscreen extends StatefulWidget {
  const singupscreen({Key? key}) : super(key: key);

  @override
  State<singupscreen> createState() => _singupscreenState();
}

class _singupscreenState extends State<singupscreen> {
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          centerTitle: true,
          title:
          Text("Sing up", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txtemail,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.email,color: Colors.grey),
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: txtpassword,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                  prefixIcon: Icon(Icons.lock,color: Colors.grey),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  var email = txtemail.text;
                  var password = txtpassword.text;
                  Shr shr = Shr();
                  shr.CreateShr(email, password);
                  Navigator.pop(context);
                },
                child: Text("Sign UP"),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Alaready Account? Sign In",
                    style: TextStyle(color: Colors.cyanAccent),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
