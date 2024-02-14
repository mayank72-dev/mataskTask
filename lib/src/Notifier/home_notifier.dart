import 'package:flutter/cupertino.dart';
import 'package:mypractical/src/Database/database.dart';
import 'package:mypractical/src/model/user.dart';
import 'package:mypractical/src/model/userdata.dart';

import '../Apiservice/apiservice.dart';

class HomeNotifier extends ChangeNotifier  {
  List<FocusNode> focusNode = [FocusNode()];

  DBHelper? dbHelper;
DataModel? dataModel;
Map<String, dynamic> userData = {};
///  user from  Api
List<Userdata> user = [];
List<Userdata> userSearch = [];


/// from sql
  Future<void> fetchUserData() async {
    try {
      Map<String, Object?>? user = await dbHelper?.getSingleData(dataModel!.id!);
    userData = user!;
    print("one user${user}");

    } catch (e) {
      print('Error fetching user data: $e');
    }
    notifyListeners();
  }
initState() async {
    /// Api call
   List<Userdata> data = await ApiService().getUser();
   Show(data);


fetchUserData();
print("user$userData");
print("user model${dataModel?.email}");
}

/// show user
Show(List<Userdata> userData)async{
  this.user =  userData;
  notifyListeners();
}
/// search from List
onSearchTextChanged(String text) async {
  if (text.isEmpty) {
    return ;}

  user.forEach((userDetail) {
    if (userDetail.firstName!.contains(text) || userDetail.lastName!.contains(text))
      userSearch.add(userDetail);
    print("usersearch${userSearch.length}");

  });

  notifyListeners();
}
}

