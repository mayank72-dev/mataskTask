import 'dart:convert';

import '../model/userdata.dart';
import 'package:http/http.dart'as http;
class ApiService {
  Future<List<Userdata>> getUser() async {
    List<Userdata> userList = [];

    var response = await http.get(
        Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      var data = (response.body);
      List<dynamic> Data = jsonDecode(data)['data'];
      Data.forEach((element) {
        Userdata post = Userdata.fromJson(element);
        userList.add(post);
      });
      return userList;
    } else {
      print("error");
      return [];
    }
  }
}