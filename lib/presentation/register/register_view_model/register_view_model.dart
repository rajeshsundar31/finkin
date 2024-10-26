import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier{

  String? _verificationId;
  String? _smsController;

  Future verifiyPhoneNumber (String mobileNumber, BuildContext context) async {
    print("insidefunct$mobileNumber");
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+91$mobileNumber',
  verificationCompleted: (PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("completed");
  },
  verificationFailed: (FirebaseAuthException e) {
    print("failed${e}");
  },
  codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
    print("codesent$verificationId");
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }


  Future<void> _signInWithPhoneNumber() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: _smsController!,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}