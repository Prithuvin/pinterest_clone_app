import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String imagePath;
  final String duration;
  final String title;
  final String profileImagePath;

  StoryCard({
    required this.imagePath,
    required this.duration,
    required this.title,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  imagePath,
                  height: 300,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                  child: Text(
                    duration,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black,
                        offset: Offset(0.0, 1.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CircleAvatar(
            backgroundImage: AssetImage(profileImagePath),
            radius: 20,
          ),
        ],
      ),
    );
  }
}
