import 'package:flutter/material.dart';
import 'package:ojt_irfan/utils/constant/path_route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: TextButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed(PathRoute.registerScreen);
            },
            child: const Text("Register"),
          ),
        ),
      ),
    );
  }
}
