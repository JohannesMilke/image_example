import 'package:flutter/material.dart';

class AssetImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlImage1 = 'assets/image_1.jpg';
    final urlImage2 = 'assets/image_2.jpg';
    final urlImage3 = 'assets/home/image_3.jpg';

    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      children: <Widget>[
        Image.asset(
          urlImage1,
          height: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        Image.asset(
          urlImage2,
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        CircleAvatar(
          backgroundImage: AssetImage(urlImage3),
          radius: 120,
        ),
      ],
    );
  }
}
