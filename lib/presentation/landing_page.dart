import 'package:finkin/components/custom_button.dart';
import 'package:finkin/core/constants/app_color.dart';
import 'package:finkin/core/constants/app_strings.dart';
import 'package:finkin/core/utils/assetutils.dart';
import 'package:finkin/core/utils/size.dart';
import 'package:finkin/presentation/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 90),
            child: Text(AppStrings.welcome, style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24
            ),),
          ),
          Image.asset(AssetsUtils.landingAvatar),
          CustomButton(
            color: AppColor.purple,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
            },
            width: displayWidth(context)/1.2,
            text: AppStrings.continueBtn,
          )
        ],
      ),
    );
  }
}