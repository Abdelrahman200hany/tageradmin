import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tageradmin/core/utils/assets.dart';
import 'package:tageradmin/feature/auth/presentation/views/sign_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ZoomIn(
          curve: Curves.bounceIn,
          duration: Duration(seconds: 3),
          child: SizedBox(
            height: 300,
            width: 300,
            child: Image.asset(Assets.imagesLogo, fit: BoxFit.scaleDown),
          ),
        ),
      ),
    );
  }

  void _splashNavigation() {
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, SignView.routeName);
    });
  }
}
