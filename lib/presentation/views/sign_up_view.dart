import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/sign_up_vm.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
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
                hint: 'Username',
                controller: nameController,
                validator: (value) {
                  return Validators.validateTextInput(value, 'username');
                },
              ),
              const CustomSpacer(flex: 3),
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
                loading: context.watch<SignUpVM>().loading,
                text: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<SignUpVM>().register(
                          email: emailController.text,
                          password: passwordController.text,
                          username: nameController.text,
                        );
                  }
                },
              ),
              const CustomSpacer(flex: 8),
              CtaText(
                desc: "Already have an account?",
                cta: "Login",
                onTap: () {
                  locator<NavigationHandler>()
                      .pushReplacementNamed(LoginViewRoute);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
