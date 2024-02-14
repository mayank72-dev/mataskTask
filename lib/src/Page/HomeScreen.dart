import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mypractical/src/Controller/customtextfied.dart';
import 'package:mypractical/src/Element/textfield_contoller.dart';
import 'package:mypractical/src/constaant/app_String.dart';
import 'package:provider/provider.dart';

import '../Notifier/home_notifier.dart';
HomeScreen() => ChangeNotifierProvider<HomeNotifier>(create: (_) => HomeNotifier(), child: Builder(builder: (context) =>HomeProviderScreen(context:context,)),);
class HomeProviderScreen extends StatelessWidget {
   HomeProviderScreen({Key? key,required BuildContext context}) : super(key: key){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var state = Provider.of<HomeNotifier>(context, listen: false);
      state.initState();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(builder: (context,state, child)=>Scaffold(
      appBar: AppBar(title: Text(AppString.homeScreen)),
    body: SingleChildScrollView(
    child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child:    Column(
      children: [
        customTextField(double.infinity, search, (value) => null, state.focusNode[0], "seaech",onChanged:(value){
          state.onSearchTextChanged(value);
          print("${value}");
        } ),
        Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(10))),
        Container(

        child:state.userSearch.isEmpty? ListView.builder(shrinkWrap: true,
        itemCount: state.user.length,
        itemBuilder: (context, index) {
        final user= state.user[index];
        return Card(color: Colors.amberAccent,
        child: Column(children: [
        Text( "firstName ${state.user[index].firstName!}"),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Text("lastName ${state.user[index].lastName!}"),
        ],),
        );
        }
        ): ListView.builder(shrinkWrap: true,
            itemCount: state.userSearch.length,
            itemBuilder: (context, index) {
              final post= state.user[index];
              return Card(color: Colors.amberAccent,
                child: Column(children: [
                  Text( "FirstName${state.userSearch[index].firstName!}"),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text("Name${state.userSearch[index].lastName!}"),
                ],),
              );
            }
        ),
        ),
      ],
    ),

    ))));
  }
}
