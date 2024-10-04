import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/Home_screen/Home_image_screen.dart';

import 'package:pinterest_clone_app/view/message_screen/message_screen.dart';
import 'package:pinterest_clone_app/view/profile_bottom_section/profile_bottom_section.dart';
import 'package:pinterest_clone_app/view/searchscreen/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 2) {
      
      _showBottomSheet();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
//showbottomsheet
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConstant.darkGrey,
      isScrollControlled: true, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          constraints: BoxConstraints(
            minHeight: 200,
            maxHeight: MediaQuery.of(context).size.height *
                0.4, 
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                  IconButton(
                    icon: Icon(Icons.close, color: ColorConstant.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  
                  Expanded(
                    child: Text(
                      "Start creating now",
                      style:
                          TextStyle(color: ColorConstant.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), 

              
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConstant.lightGrey,
                          ),
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            CupertinoIcons.pin,
                            color: ColorConstant.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Pins",
                          style: TextStyle(
                              color: ColorConstant.white, fontSize: 10),
                        ),
                      ],
                    ),
                    
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConstant.lightGrey,
                          ),
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            Icons.collections,
                            color: ColorConstant.white,
                          ),
                        ),
                        SizedBox(height: 5), 
                        Text(
                          "Collage",
                          style: TextStyle(
                              color: ColorConstant.white, fontSize: 10),
                        ),
                      ],
                    ),
                    
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorConstant.lightGrey,
                          ),
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            Icons.bookmark_add_rounded,
                            color: ColorConstant.white,
                          ),
                        ),
                        SizedBox(height: 5), 
                        Text(
                          "Boards",
                          style: TextStyle(
                              color: ColorConstant.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  
  final List<String> _images = [
    'assets/image/Beach.jpeg',
    'assets/image/c.jpeg',
    'assets/image/Flowers.webp',
    'assets/image/naked_bananna.jpeg',
    'assets/image/selena_water.jpeg',
    'assets/image/LightHouse.jpeg',
    'assets/image/Beach.jpeg',
    'assets/image/Stars.jpeg',
    'assets/image/a.jpeg',
    'assets/image/Flowers.webp',
    'assets/image/Way.jpeg',
    'assets/image/Road.jpeg',
    'assets/image/Stars.jpeg',
    'assets/image/b.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Home 
          Padding(
            padding: const EdgeInsets.all(10),
            child: MasonryGridView.count(
              crossAxisCount: 2, 
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreenImage(imageUrl: _images[index]),
                            ));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          _images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.more_horiz,
                        size: 20,
                        color: ColorConstant.white,
                      ),
                    )
                  ],
                );
              },
            ),
          ),

          // Search Screen
          Center(
            child: Searchscreen(),
          ),
          // plus
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container();
                },
              );
            },
          ),
          // message
          MessageScreen(),

          // Profile
          ProfileBottomSection()
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          backgroundColor: ColorConstant.black,
          onTap: _onItemTapped,
          selectedItemColor: ColorConstant.white,
          unselectedItemColor: ColorConstant.lightGrey,
          iconSize: 20,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: ""),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.ellipses_bubble_fill), label: ""),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_fill), label: ""),
          ],
        ),
      ),
    );
  }
}
