import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/features/auth/presentation/login_page.dart';
import 'package:flutter_firebase_setup/features/auth/widget/ui_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            UiHelper.customTextField(passwordController, 'Password', Icons.lock, isPassword: true),
            UiHelper.customButton('Sign Up', () {}),
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
      )
    );
}
}