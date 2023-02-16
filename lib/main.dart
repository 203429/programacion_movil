import 'package:flutter/material.dart';
import 'package:my_first_app/pages/login.dart';
import 'package:my_first_app/pages/recover_pass.dart';
import 'package:my_first_app/pages/register.dart';
import 'package:my_first_app/pages/reset_password.dart';
import 'package:my_first_app/screens/body_boarding.dart';
import 'package:my_first_app/screens/splash_view.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splash' : ((context) => const SplashView()),
        '/login' : ((context) => const Login()),
        '/register' : ((context) => const Register()),
        '/recover_pass' : ((context) => const RecoverPass()),
        '/reset_pass' : ((context) => const ResetPassword()),
      },
      home: const BodyBoarding(),
    );
  }
}
