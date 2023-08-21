import 'package:flutter/material.dart';
import 'package:mobile/utils/constants/font_app.dart';

class CommonBtn extends StatelessWidget {
  final String label;
  final VoidCallback voidCallback;
  final Color? color;
  const CommonBtn(
      {super.key,
      required this.label,
      required this.voidCallback,
       this.color});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: voidCallback,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.blue, Colors.purple]),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                fontFamily: manrope,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
