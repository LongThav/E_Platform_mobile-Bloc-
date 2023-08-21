import 'package:flutter/material.dart';

import '/commons/common_btn.dart';
import '/utils/constants/color_app.dart';
import '/utils/constants/font_app.dart';
import '../../../utils/constants/img_static.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({super.key});

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "E-Learning Platform",
          style: TextStyle(
              fontFamily: manrope,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
        backgroundColor: ColorsApp.colorView,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: ColorsApp.btnColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: ColorsApp.colorView,
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.18,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue, Colors.purple],
                ),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      )),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          image: DecorationImage(
                              image: AssetImage(img), fit: BoxFit.fill),
                          shape: BoxShape.circle),
                    ),
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: 'LongThav Sipav \n',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: manrope,
                                fontWeight: FontWeight.bold)),
                        TextSpan(text: 'Mobile Developer')
                      ]),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Center(
            child: Text(
              "Tracking Your Progress",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: manrope,
                  letterSpacing: 1,
                  color: ColorsApp.btnColor),
            ),
          ),
          Container(
            width: width * 0.73,
            height: height * 0.4,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(tracking), fit: BoxFit.fill)),
          ),
          CommonBtn(
              label: 'Start Learning',
              voidCallback: () {},
              color: ColorsApp.btnColor),
        ],
      ),
    );
  }
}
