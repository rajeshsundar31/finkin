import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier{

  Future verifiyPhoneNumber (String mobileNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+91$mobileNumber',
  verificationCompleted: (PhoneAuthCredential credential) {
    print("completed");
  },
  verificationFailed: (FirebaseAuthException e) {
    print("failed");
  },
  codeSent: (String verificationId, int? resendToken) {
    print("codesent");
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }
}