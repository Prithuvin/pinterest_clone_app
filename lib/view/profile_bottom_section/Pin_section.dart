

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

class PinSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              
              Expanded(
                child: Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        ColorConstant.lightGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.search,
                          color: ColorConstant.lightGrey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search your saved ideas',
                            hintStyle: TextStyle(
                              color: ColorConstant.lightGrey,
                              fontSize: 12,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
          
              IconButton(
                icon: Icon(
                  CupertinoIcons.add,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  
                },
              ),
            ],
          ),
          SizedBox(height: 10), 
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorConstant.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Icon(
                        CupertinoIcons.grid,
                        color: ColorConstant.white,
                      )),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: ColorConstant.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "favorites",
                          style: TextStyle(color: ColorConstant.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: ColorConstant.lightGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Created by you",
                          style: TextStyle(color: ColorConstant.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
