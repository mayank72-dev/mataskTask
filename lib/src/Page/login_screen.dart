
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mypractical/src/constaant/app_String.dart';
import 'package:provider/provider.dart';

import '../Controller/custiomButton.dart';
import '../Controller/customtextfied.dart';
import '../Element/textfield_contoller.dart';
import '../Notifier/login_notifier.dart';
import '../Style/colors.dart';
import '../Validation/validation.dart';
LoginScreen() => ChangeNotifierProvider<LoginNotifier>(create: (_) => LoginNotifier(), child: Builder(builder: (context) =>LoginProviderScreen(context:context,)),);
class LoginProviderScreen extends StatelessWidget {
  const LoginProviderScreen({Key? key,required BuildContext context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context,state, child)=>Scaffold(appBar: AppBar(title: Text(AppString.login),centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Form(
            key: state.fromKey,
            autovalidateMode:AutovalidateMode.onUserInteraction,

            child: Column(children: [
              customTextField(double.infinity,  email, (value) => emptyValidation(value), state.focusNode[0], AppString.email),
              Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(10))),
                customTextField(double.infinity, password,(value) => passwordValidation(value), state.focusNode[1], AppString.password,),
              Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(10))),
              customButton(() {state.Checkvalidation(context);}, AppColors.deepOrenge,AppString.save)
            ]),
          ),
        ),
      ),

    ));
  }
}
