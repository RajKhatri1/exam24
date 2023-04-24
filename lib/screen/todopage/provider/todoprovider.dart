import 'package:flutter/material.dart';

import '../model/todomodel.dart';

class todoprovider extends ChangeNotifier{
  List<Homemodel> l1 = [];

  void add(Homemodel h1)
  {
    l1.add(h1);
    notifyListeners();
  }
  void delete(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }
  void editData(int index,Homemodel m1)
  {
    l1[index] = m1;
    notifyListeners();
  }
}