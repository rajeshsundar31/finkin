import 'package:finkin/components/carosel.dart';
import 'package:finkin/components/custom_text.dart';
import 'package:finkin/components/dialog.dart';
import 'package:finkin/core/constants/app_color.dart';
import 'package:finkin/core/utils/assetutils.dart';
import 'package:finkin/core/utils/size.dart';
import 'package:finkin/presentation/dashboard/dashboard_view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {
    Future.microtask((){
      Provider.of<DashboardViewModel>(context, listen: false).init();
    });
    super.initState();
  }

   dateformat(String datevalue){
    DateTime dateTime = DateTime.parse(datevalue);
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.purple,
          shape: const CircleBorder(),
          onPressed: (){
            showDialog(context: context, builder: (context) {
              return const CustomDialog();
            });
          }, 
          child: const Icon(Icons.add, color: AppColor.white,),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CustomText(
                    text: "Hi Rajesh",
                    color: AppColor.black,
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(AssetsUtils.myProfile),
                    )
                ],
              ),
            ),
             SizedBox(
              width: displayWidth(context)/1,
              height: displayHeight(context)/2,
               child: const CustomCarousel(),
             ),
             Expanded(
               child: Consumer<DashboardViewModel>(
                builder: (context, control, child) {
                 return control.detailsList.isEmpty? Container(): ListView.builder(
                  itemCount: control.detailsList.length,
                  itemBuilder: (BuildContext context, int index) {
                     String formattedDate = DateFormat('dd-MM-yyyy').format(control.detailsList[index].tansactionDate);              
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: control.detailsList[index].expenseType == "Income"? const Icon(Icons.circle, color: AppColor.green,): const Icon(Icons.circle, color: AppColor.red,),
                        title: Text(control.detailsList[index].expenseDetail, style: const TextStyle(color: AppColor.black),
                        ),
                        trailing: IconButton(onPressed: (){
                         showModalBottomSheet(context: context, 
                        //  backgroundColor: AppColor.gold,
                         builder: (context) {
                           return SizedBox(
                            height: displayHeight(context)/3,
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const Center(
                                  child: CustomText( text: "Payment Details", fontsize: 24,),
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.message),
                                    const CustomText(text: "Detail :", fontsize: 16,),
                                    CustomText(text: control.detailsList[index].expenseDetail, fontsize: 12,),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.date_range),
                                    const CustomText(text: "Date :", fontsize: 16,),
                                    CustomText(text: formattedDate ,fontsize: 12,),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.money),
                                    const CustomText(text: "Amount :", fontsize: 16,),
                                    CustomText(text: control.detailsList[index].amount.toString(), fontsize: 12,),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(Icons.currency_exchange),
                                    const CustomText(text: "Type :", fontsize: 16,),
                                    CustomText(text: control.detailsList[index].expenseType, fontsize: 12,),
                                  ],
                                ),
                              ],
                             ),
                           );
                         },);
                        }, icon: const Icon(Icons.arrow_forward_ios)),
                        ),
                    );
                 });
               }),
             ),
          ],
        ),
      ));
  }
}