import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/features/auth/presentation/login_page.dart';
import 'package:flutter_firebase_setup/features/home_page/presentation/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    await FirebaseAuth.instance.currentUser != null
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()))
        : Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  @override
  Widget build(BuildContext context) {
    _checkUser();
    return Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
