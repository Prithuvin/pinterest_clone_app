

import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

class UpdateWidget extends StatelessWidget {
  final String updateImage;
  final String text;
  final String hours;

  UpdateWidget({
    Key? key,
    required this.updateImage,
    required this.text,
    required this.hours,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        color: ColorConstant.black,
        child: ListTile(
          iconColor: ColorConstant.white,
          textColor: ColorConstant.white,
          tileColor: ColorConstant.black,
          leading: Container(
            width: 40,
            height: 100,
            decoration: BoxDecoration(
              color: ColorConstant.black,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(updateImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                hours,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Spacer(),
              Icon(
                Icons.more_horiz,
                size: 15,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
