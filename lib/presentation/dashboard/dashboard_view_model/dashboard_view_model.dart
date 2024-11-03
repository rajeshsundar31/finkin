import 'dart:convert';

import 'package:finkin/model/details_model.dart';
import 'package:finkin/service/api.service.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  List<Transactions> detailsList = [];

  init(){
    fetchExpenseList();
  }
  
  void fetchExpenseList () async {
    var expense = await CommonApiServices().fetchData("/getexpense");
    print(json.decode(expense));
    var decodeData = json.decode(expense);
    if(decodeData != null) {
      
     detailsList = List<Transactions>.from(
      decodeData.map((x) => Transactions.fromJson(x))
    );
    notifyListeners();
    } else {
      throw jsonDecode(expense)['message'] ?? "Unknown error occoured";
    }
  }

  void saveDataToDb({required double  amount, required String expenseDetail, required String expenseType}) async {
    DateTime currentDate = DateTime.now();
     
    // String formattedDate = "${currentDate.year.toString().padLeft(4, '0')}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}";

    Map data = {
      "expenseDetail": expenseDetail,
      "amount": amount,
      "expenseType": expenseType,
      "tansactionDate": currentDate.toIso8601String()
    };
    var addData = await CommonApiServices().saveData("/expensedetail", json.encode(data));
    fetchExpenseList();
    notifyListeners();

  }

 
}