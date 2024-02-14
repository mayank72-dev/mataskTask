

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mypractical/src/Element/textfield_contoller.dart';
import 'package:mypractical/src/Page/HomeScreen.dart';
import 'package:mypractical/src/model/user.dart';

import '../Database/database.dart';

class LoginNotifier extends ChangeNotifier   {
  List<FocusNode> focusNode = [FocusNode(), FocusNode(),FocusNode(),];
  final fromKey = GlobalKey<FormState>();
  DBHelper ?dbHelper;
  DataModel? dataModel;

  void Checkvalidation(context) async {
    if (fromKey.currentState!.validate()) {

      final  DataModel model= DataModel(password: password.text,
        email: email.text,
        id: dataModel?.id,);
      await dbHelper?.insert(model);

      print("add data");

   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    } else {
      print("invalid data");
notifyListeners();
    }

  }

}