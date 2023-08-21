import 'package:flutter/material.dart';

import '../../commons/common_btn.dart';
import '../../utils/constants/color_app.dart';
import '../../utils/constants/font_app.dart';
import '../../views/auth_views/welcome_view.dart';

import '../../utils/rests/handle_push_view.dart';
import '../../utils/constants/img_static.dart';

class PasswordResetSuccessfullyView extends StatefulWidget {
  const PasswordResetSuccessfullyView({super.key});

  @override
  State<PasswordResetSuccessfullyView> createState() =>
      _PasswordResetSuccessfullyViewState();
}

class _PasswordResetSuccessfullyViewState
    extends State<PasswordResetSuccessfullyView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            backView(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: width,
              height: height * 0.43,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(success),
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Container(
              width: width * 0.2,
              height: height * 0.1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(marks), fit: BoxFit.fill)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Successful",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[700]),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Password Change Successfully",
              style: TextStyle(
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey[700]),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CommonBtn(
                label: 'Get Started',
                voidCallback: () {
                  backView(context);
                  backView(context);
                  backView(context);
                  backView(context);
                  backView(context);
                  pusReplaceView(context, const WelcomeView());
                },
                color: ColorsApp.btnColor)
          ],
        ),
      ),
    );
  }
}
