import 'dart:convert';

import 'package:exam24/screen/apicalling/model/apimodel.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  Future<Apimodel> getapi() async {
    String link = "https://corona-virus-world-and-india-data.p.rapidapi.com/api";
    Uri uri = Uri.parse(link);
    var responce = await http.get(uri, headers: {
      "content-type": "application / octet - stream",
      "X-RapidAPI-Key": "19c83df79cmsh6882f0907a2503ep10b207jsn1ba7b313aad2",
      "X-RapidAPI-Host": "corona-virus-world-and-india-data.p.rapidapi.com",
    });
    var json = jsonDecode(responce.body);
    Apimodel a1 = Apimodel.fromJson(json);
    return a1;
  }
}