import 'package:finkin/components/carosel.dart';
import 'package:finkin/components/custom_text.dart';
import 'package:finkin/components/pie_chart.dart';
import 'package:finkin/core/constants/app_color.dart';
import 'package:finkin/core/utils/assetutils.dart';
import 'package:finkin/core/utils/size.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.purple,
          shape: const CircleBorder(),
          onPressed: (){}, 
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
          ],
        ),
      ));
  }
}