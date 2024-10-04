import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/utils/constants/image_constants.dart';
import 'package:pinterest_clone_app/view/login_screen/login_screen.dart';
import 'package:pinterest_clone_app/view/sign_up/sign_up.dart';

// import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<OnBordingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.black,
          toolbarHeight: 10,
        ),
        backgroundColor: ColorConstant.black,
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(ImageConstants.ON_BORDING_BG),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 96,
                    width: 96,
                    ImageConstants.APP_LOGO,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Welcome to Pinterest",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        color: ColorConstant.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpApp(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ColorConstant.primaryColor),
                        child: const Center(
                          child: Text(
                            "Sign up",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorConstant.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: ColorConstant.lightGrey),
                        child: const Center(
                          child: Text(
                            "Log in",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorConstant.white),
                          ),
                        ),
                      ),
                    ),
                  ),
               
                  const SizedBox(
                    height: 21,
                  ),
                  const Column(
                    children: [
                      Text(
                        "By continuing, you agree to Pinterest's Terms of Services and",
                        style:
                            TextStyle(fontSize: 12, color: ColorConstant.white),
                      ),
                      Text(
                        "acknoledge you've read our Privacy Policy",
                        style:
                            TextStyle(fontSize: 12, color: ColorConstant.white),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
