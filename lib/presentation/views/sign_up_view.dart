import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
              text: 'Sign Up',
              onPressed: () {},
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
        );
      },
    );
  }
}
