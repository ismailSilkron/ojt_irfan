import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ojt_irfan/screen/auth/bloc/auth_bloc.dart';
import 'package:ojt_irfan/screen/auth/widget/auth_field.dart';
import 'package:ojt_irfan/screen/auth/widget/auth_gradient_button.dart';
import 'package:ojt_irfan/utils/constant/path_route.dart';
import 'package:ojt_irfan/utils/widget/show_snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final AuthBloc _authBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _authBloc = AuthBloc();
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
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) async {
          if (state is AuthLoading) {
            await showDialog(
              context: context,
              builder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            );
          }

          if (state is AuthFailure) {
            if (mounted) {
              Navigator.of(context).pop();
            }
            if (mounted) {
              showSnackbar(context: context, message: state.message);
            }
          }

          if (state is AuthSuccess) {
            if (mounted) {
              Navigator.of(context).pop();
            }
            if (mounted) {
              showSnackbar(context: context, message: "Successfully register");
            }
            if (mounted) {
              await Navigator.pushReplacementNamed(
                context,
                PathRoute.homeScreen,
                arguments: {
                  "username": state.user.name,
                },
              );
            }
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              // dismiss/unfocus current selected/active field
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
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
                            _authBloc.add(AuthRegister(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            ));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
