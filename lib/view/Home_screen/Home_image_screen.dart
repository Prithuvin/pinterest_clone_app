
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

class HomeScreenImage extends StatelessWidget {
  final String imageUrl;

  HomeScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageUrl), fit: BoxFit.cover)),
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: CircleAvatar(
                              backgroundColor:
                                  ColorConstant.black.withOpacity(0.2),
                              child: Icon(
                                CupertinoIcons.chevron_back,
                                color: ColorConstant.white,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10)),
                                ),
                                backgroundColor: ColorConstant.darkGrey,
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 330,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Icon(
                                                  CupertinoIcons.xmark,
                                                  color: ColorConstant.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                "Options",
                                                style: TextStyle(
                                                    color: ColorConstant.white),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "Follow mr__eccentric__",
                                            style: TextStyle(
                                                color: ColorConstant.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Icon(
                            Icons.more_horiz,
                            color: ColorConstant.white,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundColor: ColorConstant.black.withOpacity(0.6),
                        child: Icon(
                          CupertinoIcons.viewfinder,
                          color: ColorConstant.white,
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 30,
              left: 10,
              right: 10,
            ),
            color: ColorConstant.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: ColorConstant.white,
                ),
                Row(
                  children: [
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            color: ColorConstant.lightGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "View",
                          style: TextStyle(color: ColorConstant.white),
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: BoxDecoration(
                            color: ColorConstant.primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Save",
                          style: TextStyle(color: ColorConstant.white),
                        ))
                  ],
                ),
                Icon(Icons.share),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
