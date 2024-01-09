import 'package:bakery_app/core/utils/user_login_params.dart';
import 'package:bakery_app/features/presentation/bloc/user_login/auth_bloc.dart';

import 'package:bakery_app/features/presentation/pages/dough_list_page.dart';
import 'package:bakery_app/features/presentation/widgets/custom_button.dart';
import 'package:bakery_app/features/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/auth-page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _signinFormKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, DoughListPage.routeName, (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.user!.token as String,
                ),
              ),
            );
            
          }

          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error as String,
                ),
              ),
            );
      
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color.fromARGB(115, 233, 233, 233),
            child: Form(
              key: _signinFormKey,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 200,
                        child: Lottie.asset('assets/bakery.json',
                            repeat: false, animate: true)),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _userNameController,
                      hintText: 'UserName',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      text: 'Sign In',
                      onTap: () {
                        if (_signinFormKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthLoginRequested(
                                  userLoginParams: UserLoginParams(
                                    userName: _userNameController.text.trim(),
                                    password: _passwordController.text.trim(),
                                  ),
                                ),
                              );
                        }
                      },
                      color: Colors.amber,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
