import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/features/auth/widget/ui_helper.dart';
import 'package:flutter_firebase_setup/features/home_page/presentation/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.customAlartDialog(context, 'Error', 'Please fill all fields');
      return;
    }
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UiHelper.customAlartDialog(context, 'Success', 'Sign Up Successful');
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      UiHelper.customAlartDialog(context, 'Error', e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UiHelper.customTextField(emailController, 'Email', Icons.email),
              UiHelper.customTextField(
                  passwordController, 'Password', Icons.lock,
                  isPassword: true),
              UiHelper.customButton('Sign Up', () {
                _signUp(emailController.text, passwordController.text);
              }),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Log In'),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
