
import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/On_bording_screen/on_bording_screen.dart';
import 'package:pinterest_clone_app/view/sign_up/sign_up_pass.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatefulWidget {
  const SignUpApp({super.key});

  @override
  State<SignUpApp> createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final _formKey = GlobalKey<FormState>();

  final String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  String? _validatedEmail; 

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
            style: TextStyle(color: ColorConstant.white),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorConstant.white,
          ),
          onPressed: () {
      
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      
                      if (!RegExp(emailPattern).hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      labelStyle: TextStyle(
                          color: ColorConstant.primaryColor, fontSize: 20),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstant.primaryColor),
                      ),
                    ),
                    style: const TextStyle(color: ColorConstant.white),
                    cursorColor: ColorConstant.primaryColor,
                    cursorWidth: 2.0,
                    cursorHeight: 24.0,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            const Spacer(),
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
                    if (_formKey.currentState!.validate()) {
                      
                      _validatedEmail = _emailController.text;

         
                      print('Validated Email: $_validatedEmail');

        
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPass()));
                    }
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
