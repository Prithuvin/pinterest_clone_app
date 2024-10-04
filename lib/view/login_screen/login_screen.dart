import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/On_bording_screen/on_bording_screen.dart';
import 'package:pinterest_clone_app/view/login_screen/login_pass.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 54, vertical: 20),
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorConstant.white, fontSize: 16),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorConstant.white),
          onPressed: () {
            // Handle back button press
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnBordingScreen()));
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's your email?",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email address',
                labelStyle:
                    TextStyle(color: ColorConstant.primaryColor, fontSize: 20),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorConstant.primaryColor),
                ),
              ),
              style: const TextStyle(color: ColorConstant.white),
              cursorColor: ColorConstant.primaryColor,
              cursorWidth: 2.0,
              cursorHeight: 24.0,
              keyboardType: TextInputType.emailAddress,
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ColorConstant.black,
                    backgroundColor: Colors.red, // foreground
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPass()));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
