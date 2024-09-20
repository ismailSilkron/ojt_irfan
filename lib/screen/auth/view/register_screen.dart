import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ojt_irfan/screen/auth/widget/auth_field.dart';
import 'package:ojt_irfan/screen/auth/widget/auth_gradient_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 200,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(30),
                AuthField(
                  fieldType: FieldType.text,
                  controller: _nameController,
                  hintText: "Name",
                ),
                const Gap(15),
                AuthField(
                  fieldType: FieldType.email,
                  controller: _emailController,
                  hintText: "Email",
                ),
                const Gap(15),
                AuthField(
                  fieldType: FieldType.password,
                  controller: _passwordController,
                  hintText: "Password",
                ),
                const Gap(20),
                AuthGradientButton(
                  title: "Register now",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // TODO call bloc to register
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
