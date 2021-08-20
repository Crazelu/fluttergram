import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (_) {
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            const CustomSpacer(flex: 20),
            const InstagramText(),
            const CustomSpacer(flex: 10),
            CustomTextField(
              hint: 'email',
              controller: emailController,
            ),
            const CustomSpacer(flex: 3),
            CustomTextField(
              hint: 'password',
              controller: passwordController,
            ),
            const CustomSpacer(flex: 8),
            CustomButton(
              text: 'Login',
              onPressed: () {},
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
        );
      },
    );
  }
}
