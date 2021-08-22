import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/login_vm.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (_) {
        return Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: [
              const CustomSpacer(flex: 20),
              const InstagramText(),
              const CustomSpacer(flex: 10),
              CustomTextField(
                hint: 'Email',
                controller: emailController,
                validator: (value) {
                  return Validators.validateEmail(value);
                },
              ),
              const CustomSpacer(flex: 3),
              CustomTextField(
                hint: 'Password',
                controller: passwordController,
                validator: (value) {
                  return Validators.validatePassword(value);
                },
              ),
              const CustomSpacer(flex: 8),
              CustomButton(
                loading: context.watch<LoginVM>().loading,
                text: 'Login',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginVM>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  }
                },
              ),
              const CustomSpacer(flex: 8),
              CtaText(
                desc: "Don't have an account?",
                cta: "Sign Up",
                onTap: () {
                  locator<NavigationHandler>()
                      .pushReplacementNamed(SignUpViewRoute);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
