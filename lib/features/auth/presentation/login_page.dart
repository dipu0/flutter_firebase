import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/features/auth/presentation/signup_page.dart';
import 'package:flutter_firebase_setup/features/auth/widget/ui_helper.dart';

class LogInPage extends StatefulWidget {
   const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            UiHelper.customTextField(passwordController, 'Password', Icons.lock, isPassword: true),
            UiHelper.customButton('Log In', () {}),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                  child: Text('Register'),
                )
              ],
            ),

          ],
        ),
      )
    );
  }
}