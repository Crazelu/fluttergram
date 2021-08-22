import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        // FirebaseAuth.instance.signOut();
        Future.delayed(const Duration(seconds: 2)).then(
          (_) => locator<NavigationHandler>()
              .pushReplacementNamed(AuthBridgeViewRoute),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (_) {
        return const Center(
          child: const InstagramText(),
        );
      },
    );
  }
}
