import 'dart:convert';

import 'package:finkin/presentation/dashboard/dashboard.dart';
import 'package:finkin/service/api.service.dart';
import 'package:flutter/material.dart';

abstract class RegisterView {
void saveUserDetails({required String email, required String password, required String userName, required BuildContext context});
}

class RegisterViewModel extends ChangeNotifier implements RegisterView {
  String? customerName;
  @override
  saveUserDetails({required String email, required String password, required String userName, required BuildContext context}) async {
    Map data = {
      "email": email,
      "password": password,
      "name": userName
    };
    customerName = userName;
    var result = await CommonApiServices().saveData("/register", json.encode(data), context);  
    result = jsonDecode(result);
    if (result['success'] == true) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const Dashboard())
      );
  }
}}