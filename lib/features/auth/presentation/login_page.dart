import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/features/auth/presentation/signup_page.dart';
import 'package:flutter_firebase_setup/features/auth/widget/ui_helper.dart';
import 'package:flutter_firebase_setup/features/home_page/presentation/home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _LogIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.customAlartDialog(context, 'Error', 'Please fill all fields');
      return;
    }
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      UiHelper.customAlartDialog(context, 'Success', 'Log In Successful');
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
          title: Text('Log In'),
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
              UiHelper.customButton('Log In', () {
                _LogIn(emailController.text, passwordController.text);
              }),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Text('Register'),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
