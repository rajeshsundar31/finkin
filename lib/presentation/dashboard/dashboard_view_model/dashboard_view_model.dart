import 'package:finkin/model/details_model.dart';
import 'package:flutter/material.dart';

class DashboardViewModel extends ChangeNotifier {
  List<DetailsModel> detailsList = [];

  expanseList({required String amount, required String  details, required String type}){
    var listDetail = DetailsModel(
      totalBla: "60000", 
      expenseDetails: details,
      amount: double.parse(amount), 
      date: DateTime.now(), 
      transactionType: type
      );
      detailsList.add(listDetail);
      print(detailsList.length);
    notifyListeners();
  }

 
}