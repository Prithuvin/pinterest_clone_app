import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/utils/constants/image_constants.dart';
import 'package:pinterest_clone_app/view/On_bording_screen/on_bording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBordingScreen()));
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.black,
        body: Center(
          child: Image.asset(width: 100, height: 100, ImageConstants.APP_LOGO),
        ));
  }
}
