import 'package:flutter/material.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  // initially, show the login page
  bool showloginPage = true;

  void toggleScreen () {
    setState(() {
      showloginPage = !showloginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showloginPage){
      return LoginScreen(showRegisterPage: toggleScreen);
    } else {
      return RegisterScreen(showLoginPage: toggleScreen);
    }
  }
}
