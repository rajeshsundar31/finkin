import 'package:finkin/components/custom_button.dart';
import 'package:finkin/components/custom_text.dart';
import 'package:finkin/core/constants/app_color.dart';
import 'package:finkin/core/constants/app_strings.dart';
import 'package:finkin/core/utils/size.dart';
import 'package:finkin/presentation/register/register_view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    Future.microtask((){
      Provider.of<RegisterViewModel>(context, listen: false);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<RegisterViewModel>(
            builder: (context, userRegister, child) {
              return Column(
              children: [
                SizedBox(
                  height: displayHeight(context)* 0.40,
                  child: const Center(
                    child: CustomText(
                      text: "LogIn",
                    ),
                  ),
                ),
                SizedBox(
                  height: displayHeight(context)* 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: displayWidth(context)/1.2,
                        child: TextFormField(
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Your Mobile Number",
                            labelText: "Mobile Number"
                          ),
                        ),
                      ),
                      CustomButton(
                        color: AppColor.purple,
                        text: AppStrings.continueBtn,
                        onPressed: () {
            
                          print("inputValue${mobileController.text}");
                        },
                        width: displayWidth(context)/1.7,
                      )
                    ],
                  )
                )
              ],
            );
              
            },
            
          ),
        ),
      )
      );
  }
}