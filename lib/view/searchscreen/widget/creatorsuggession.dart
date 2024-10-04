import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

// ignore: must_be_immutable
class CreatorSuggession extends StatelessWidget {
  String image;
  String Duration;
  String profileimage;
  CreatorSuggession(
      {super.key,
      required this.Duration,
      required this.image,
      required this.profileimage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 250,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.transparent, 
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 200,
            width: 120,
            decoration: BoxDecoration(
                color:
                    ColorConstant.lightGrey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          bottom: 0, 
          left: 30, 
          child: CircleAvatar(
            radius: 3, 
            backgroundColor: Colors.black, 
            child: Icon(Icons.person), 
          ),
        ),
        Positioned(
          bottom: 1, 
          left: 31,
          child: CircleAvatar(
            backgroundImage: AssetImage(profileimage),
            radius: 30, 
            backgroundColor: Colors.white,
           
          ),
        ),
        Positioned(
          left: 5,
          bottom: 200,
          child: Container(
            height: 20,
            width: 35,
            decoration: BoxDecoration(
                color: ColorConstant.lightGrey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              Duration,
              style: TextStyle(fontSize: 12, color: ColorConstant.white),
            ),
          ),
        )
      ],
    );
  }
}
