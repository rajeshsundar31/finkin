import 'package:finkin/components/carosel.dart';
import 'package:finkin/components/custom_text.dart';
import 'package:finkin/components/dialog.dart';
import 'package:finkin/core/constants/app_color.dart';
import 'package:finkin/core/utils/assetutils.dart';
import 'package:finkin/core/utils/size.dart';
import 'package:finkin/presentation/dashboard/dashboard_view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
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
      Provider.of<DashboardViewModel>(context, listen: false);
    });
    // TODO: implement initState
    super.initState();
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
              return CustomDialog();
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
               child: CustomCarousel(),
             ),
             Expanded(
               child: Consumer<DashboardViewModel>(
                builder: (context, control, child) {
                 return control.detailsList.isEmpty? Container(): ListView.builder(
                  itemCount: control.detailsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        leading: control.detailsList[index].transactionType == "Income"? const Icon(Icons.circle, color: AppColor.green,): const Icon(Icons.circle, color: AppColor.red,),
                        title: Text(control.detailsList[index].expenseDetails, style: TextStyle(color: AppColor.black),
                        ),
                        trailing: IconButton(onPressed: (){
                         showModalBottomSheet(context: context, 
                         backgroundColor: AppColor.gold,
                         builder: (context) {
                           return Column(
                            children: [
                              const Center(
                                child: Text("Payment Details"),
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(control.detailsList[index].date.toString()),
                                  Text("\$ ${control.detailsList[index].amount.toString()}")
                                ],
                              )
                            ],
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