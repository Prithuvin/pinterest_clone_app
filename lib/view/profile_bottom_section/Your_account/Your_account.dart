import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

class YourAccount extends StatefulWidget {
  const YourAccount({super.key});

  @override
  State<YourAccount> createState() => _YourAccountState();
}

class _YourAccountState extends State<YourAccount>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: AppBar(
          backgroundColor: ColorConstant.black,
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 100,
          leading: Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 10,
                backgroundColor: ColorConstant.black,
                child: Icon(
                  CupertinoIcons.chevron_back,
                  color: ColorConstant.white,
                ), // Replace with your image path
              ),
            ),
          ),
          title: Text(
            "Your Account",
            style: TextStyle(color: ColorConstant.white, fontSize: 15),
          )),
    );
  }
}
