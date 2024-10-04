import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';
import 'package:pinterest_clone_app/view/DummyDb.dart';
import 'package:pinterest_clone_app/view/searchscreen/widget/creatorsuggession.dart';
import 'package:pinterest_clone_app/view/searchscreen/widget/gridview.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

final List<String> imagePaths = [
  'assets/image/Way.jpeg',
  'assets/image/Stars.jpeg',
  'assets/image/LightHouse.jpeg',
  'assets/image/Beach.jpeg',
  'assets/image/Flowers.webp'
];

final List<String> imageTexts = [
  'Vibe',
  'Astrophile',
  'Light vessel',
  'Shore',
  'Blossom'
];

final List<String> imageTextQuote = [
  '\n\n“Every path has a purpose. Trust the journey.”',
  '\n\n“Even in darkness, the stars will guide you."',
  '\n\n“Be the lighthouse that guides others.”',
  '\n\n"Sandy toes, sun-kissed nose."',
  '\n\n“Bloom where you are planted.”'
];

late List<Widget> _pages;
int _activePage = 0;
final PageController _pageController = PageController(initialPage: 0);
Timer? _timer;

class _SearchscreenState extends State<Searchscreen> {
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imagePaths.length - 1) {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = List.generate(
      imagePaths.length,
      (index) => ImageDisplay(
        imagePath: imagePaths[index],
        imageText: imageTexts[index], 
        imageQuote: imageTextQuote[index], 
      ),
    );
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imagePaths.length,
                    onPageChanged: (value) {
                      setState(() {
                        _activePage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _pages[index];
                    },
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstant.darkGrey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search pinterest..',
                            hintStyle:
                                TextStyle(color: ColorConstant.lightGrey),
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search,
                                color: ColorConstant.lightGrey),
                            suffixIcon: Icon(Icons.camera_alt,
                                color: ColorConstant.lightGrey),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _pages.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(index,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              radius: 3,
                              backgroundColor: _activePage == index
                                  ? ColorConstant.white
                                  : ColorConstant.lightGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text("Ideas from creators",
                  style: TextStyle(
                      fontSize: 12,
                      backgroundColor: ColorConstant.black,
                      color: ColorConstant.white)),
            ),
            SizedBox(
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CreatorSuggession(
                            Duration: Dummydb.SearchPageList[index]['duration'],
                            image: Dummydb.SearchPageList[index]['image'],
                            profileimage: Dummydb.SearchPageList[index]
                                ['profileimage'],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: 5),
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text(
                'Ideas for you',
                style: TextStyle(fontSize: 12, color: ColorConstant.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GridviewWidget(
                          image: Dummydb.SearchPageList[index]['image'],
                          text: Dummydb.SearchPageList[index]['text'],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 1,
                        ),
                    itemCount: 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text(
                'Popular on Pinterest',
                style: TextStyle(fontSize: 12, color: ColorConstant.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GridviewWidget(
                          image: Dummydb.SearchPageList[1]['image'],
                          
                          text: Dummydb.SearchPageList[2]['text'],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 1,
                        ),
                    itemCount: 5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDisplay extends StatelessWidget {
  final String? imagePath;
  final String? imageText;
  final String? imageQuote;
  const ImageDisplay(
      {super.key, this.imagePath, this.imageText, this.imageQuote});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        imagePath!,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      Center(
        child: Positioned(
          top: 20,
          left: 15,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              imageText ?? 'Image',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            imageQuote ?? 'ImageQuote',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]);
  }
}
