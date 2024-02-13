import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/features/auth/widget/ui_helper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(emailController, 'Email', Icons.email),
          UiHelper.customButton("Reset", () {
            _resetPassword(emailController.text);
          }),
        ],
      )),
    );
  }

  _resetPassword(String email) async {
    if (email.isEmpty) {
      UiHelper.customAlartDialog(context, 'Error', 'Please fill all fields');
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      UiHelper.customAlartDialog(context, 'Success', 'Reset Email Sent');
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      UiHelper.customAlartDialog(context, 'Error', e.message.toString());
    }
  }
}
