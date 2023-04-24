import 'package:exam24/screen/apicalling/model/apimodel.dart';
import 'package:exam24/utils/Apihelper.dart';
import 'package:flutter/material.dart';

class apiprovider extends ChangeNotifier{
  Apimodel? apimodel;
  Future<Apimodel?> apicall()
  async {
    apimodel =await Apihelper().getapi();
    return apimodel;
  }

}