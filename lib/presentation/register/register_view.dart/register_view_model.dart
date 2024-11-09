import 'dart:convert';

import 'package:finkin/presentation/dashboard/dashboard.dart';
import 'package:finkin/service/api.service.dart';
import 'package:flutter/material.dart';

class RegisterViewModel  extends ChangeNotifier{
  saveUserDetails({required String email, required String password, required BuildContext context}) async {
    Map data = {
      "email": email,
      "password": password
    };
    var result = await CommonApiServices().saveData("/register", json.encode(data), context);  
    result = jsonDecode(result);
    if (result['success'] == true) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const Dashboard())
      );
  };
}}