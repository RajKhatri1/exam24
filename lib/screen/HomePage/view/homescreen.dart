import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Exam"),centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                  Navigator.pushNamed(context, 'pattern');
              }, child: Text("Pattern"),),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'login');
              }, child: Text("todo"),),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, 'api');
              }, child: Text("API"),),
            ],
          ),
        ),
      ),
    );
  }
}
