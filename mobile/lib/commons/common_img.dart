import 'package:flutter/material.dart';

class CommonImg extends StatelessWidget {
  final DecorationImage image;
  const CommonImg({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: width,
      height: height * 0.35,
      decoration: BoxDecoration(image: image),
    );
  }
}
