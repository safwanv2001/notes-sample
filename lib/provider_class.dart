import 'package:flutter/cupertino.dart';

class ProviderClass extends ChangeNotifier{
  List notes=[];

  void addNote(Map data){
    notes.add(data);
    notifyListeners();
  }
}