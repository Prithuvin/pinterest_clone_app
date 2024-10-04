//

import 'package:flutter/material.dart';
import 'package:pinterest_clone_app/utils/constants/color_constant.dart';

class GridviewWidget extends StatelessWidget {
  final String image;
  final String text;

  GridviewWidget({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 1,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildGridItem(image, text),
        _buildGridItem(image, text),
      ],
    );
  }

  Widget _buildGridItem(String image, String text) {
    return Stack(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstant.lightGrey,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstant.black.withOpacity(.6),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: ColorConstant.white, fontSize: 12),
          )),
        ),
      ],
    );
  }
}
