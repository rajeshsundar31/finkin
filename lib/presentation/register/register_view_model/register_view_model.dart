import 'package:finkin/presentation/register/otp_view/otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier{

  Future verifiyPhoneNumber (String mobileNumber, BuildContext context) async {
    print("insidefunct$mobileNumber");
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+91 $mobileNumber',
  verificationCompleted: (PhoneAuthCredential credential) {
    print("completed");
  },
  verificationFailed: (FirebaseAuthException e) {
    print("failed${e}");
  },
  codeSent: (String verificationId, int? resendToken) {
   
    print("codesent$verificationId");
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }
}