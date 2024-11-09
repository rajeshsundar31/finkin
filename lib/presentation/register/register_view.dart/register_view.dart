import 'package:finkin/components/custom_button.dart';
import 'package:finkin/components/custom_text.dart';
import 'package:finkin/core/constants/app_color.dart';
import 'package:finkin/core/constants/app_strings.dart';
import 'package:finkin/core/utils/assetutils.dart';
import 'package:finkin/core/utils/size.dart';
import 'package:finkin/presentation/register/register_view.dart/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

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
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Consumer<RegisterViewModel>(
              builder: (context, userRegister, child) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 190),
                      child: Image.asset(AssetsUtils.payment),
                    ),
                    Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context)* 0.40,
                      child: const Center(
                        child: CustomText(
                          text: "Register User",
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
                              controller: emailContoller,
                              validator: (value) {
                                if (value == null || value.length < 4){
                                  return 'Please Enter valid Mail Addess';
                                } else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Your Valid Mail",
                                labelText: "Email"
                              ),
                            ),
                          ),
                          SizedBox(
                            width: displayWidth(context)/1.2,
                            child: TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.phone,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Enter Strong Password",
                                labelText: "Password"
                              ),
                              validator: (value) {
                                if (value == null){
                                  return 'Password cannot be Empty';
                                } else if (value.length < 4 && value.length > 12){
                                  return 'Password must be more than 4 letter and less than 12';
                                } else{
                                  return null;
                                }
                              },
                            ),
                          ),
                          CustomButton(
                            color: AppColor.purple,
                            text: AppStrings.continueBtn,
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                userRegister.saveUserDetails(email: emailContoller.text, password: passwordController.text, context: context);
                              }        
                            },
                            width: displayWidth(context)/1.3,
                          )
                        ],
                      )
                    )
                  ],
                                ),
                    
                  ],
                );
                
              },
              
            ),
          ),
        ),
      )
      );
  }
}