// void main() {
//   runApp(MaterialApp(
//     home: ProfileBottomSection(),
//     debugShowCheckedModeBanner: false, // Remove debug banner
//   ));
// }

import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/profile_bottom_section/Board_section.dart';
import 'package:pinterest_clone_app/view/profile_bottom_section/Pin_section.dart';
import 'package:pinterest_clone_app/view/profile_bottom_section/Your_account/Your_account.dart';

class ProfileBottomSection extends StatefulWidget {
  const ProfileBottomSection({super.key});

  @override
  State<ProfileBottomSection> createState() => _ProfileBottomSectionState();
}

class _ProfileBottomSectionState extends State<ProfileBottomSection>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Properly dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: ColorConstant.black,
      appBar: AppBar(
        backgroundColor: ColorConstant.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourAccount(),
                ),
              );
            },
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(
                  'assets/image/selena_rare.jpeg'), // Replace with your image path
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            // Use a container to allow for additional widgets
            height: 40, // Adjust height as needed
            child: TabBar(
              dividerHeight: 0,
              labelPadding: EdgeInsets.symmetric(horizontal: 5),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
              controller: _tabController,
              unselectedLabelColor: ColorConstant.white,
              labelColor: ColorConstant.white,
              indicatorColor: ColorConstant.white,
              tabs: [
                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Text("Pins"),
                ),
                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Text("Boards"),
                ),
                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Text("Collages"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        //pinsection
        PinSection(),

        //boardsection
        BoardSection(),

        //collagesection
        Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/image/IMG_4399.PNG',
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Collage your favorite ideas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Cut out and combine anything visual that inspires you to \n create a collage",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: ColorConstant.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Start a Collages ",
                    style: TextStyle(
                        color: ColorConstant.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ])),
      ]),
    );
  }
}
