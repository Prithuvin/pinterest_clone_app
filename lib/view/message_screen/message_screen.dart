import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/DummyDb.dart';
import 'package:pinterest_clone_app/view/message_screen/UpdateWidget.dart';
import 'package:pinterest_clone_app/view/message_screen/message_section.dart';

class MessageScreen extends StatefulWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }

  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
 
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
              child: Container(
                height: 40,
                child: TabBar(
                  dividerHeight: 0,
                  controller: _tabController, 
                  labelColor: ColorConstant.black,
                  unselectedLabelColor: ColorConstant.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: ColorConstant.white,
                  ),
                  tabs: [
                    Tab(
                      text: "Updates",
                    ),
                    Tab(text: "Messages"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController, 
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) => UpdateWidget(
                        updateImage: Dummydb.SearchPageList[index]["image"],
                        text: Dummydb.SearchPageList[index]["text"],
                        hours: Dummydb.SearchPageList[index]["hours"]),
                    itemCount: Dummydb.SearchPageList.length,
                  ),
                  MessageSection()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
