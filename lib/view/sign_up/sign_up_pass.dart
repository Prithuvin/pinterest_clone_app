

import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/On_bording_screen/on_bording_screen.dart';
import 'package:pinterest_clone_app/view/login_screen/login_screen.dart';

void main() => runApp(SignUpPass());

class SignUpPass extends StatelessWidget {
  const SignUpPass({super.key});

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
  final _passwordController =
      TextEditingController(); 
  String? _errorMessage; 
  String? _validatedPassword; 

  bool _isPasswordValid(String password) {
    
    if (password.isEmpty) {
      setState(() {
        _errorMessage = 'Password cannot be empty';
      });
      return false;
    } else if (password.length < 6) {
      setState(() {
        _errorMessage = 'Password must be at least 6 characters long';
      });
      return false;
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      setState(() {
        _errorMessage = 'Password must contain at least one special character';
      });
      return false;
    }

   
    setState(() {
      _errorMessage = null; 
    });
    return true;
  }

  void _onNextPressed() {
    final password = _passwordController.text; 

    if (_isPasswordValid(password)) {
     
      _validatedPassword = password;

      
      print('Validated Password: $_validatedPassword');

      
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginScreen()), 
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 54, vertical: 20),
          child: Text(
            'Sign up',
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
              "Enter your password?",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ColorConstant.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                labelStyle: const TextStyle(
                    color: ColorConstant.primaryColor, fontSize: 20),
                border: InputBorder.none,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorConstant.primaryColor),
                ),
                errorText: _errorMessage, 
              ),
              style: const TextStyle(color: ColorConstant.white),
              cursorColor: ColorConstant.primaryColor,
              cursorWidth: 2.0,
              cursorHeight: 24.0,
              obscureText: true,
            ),
            const Spacer(),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ColorConstant.black,
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: _onNextPressed, 
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
