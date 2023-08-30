import 'package:flutter/material.dart';
import 'package:mobile/commons/common_sign_up.dart';
import '../../utils/rests/handle_push_view.dart';
import '../../views/auth_views/sign_in_view.dart';

import '../../commons/common_btn.dart';
import '../../utils/constants/color_app.dart';
import '../../utils/constants/font_app.dart';
import '../../utils/constants/img_static.dart';
import 'signup_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth > 600){
            return Column(
              children: [
                Text("Fuck Fuck"),
              ],
            );
          }else{
            return _buildBody(context);
          }
        }
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: height * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(welcom),
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            const Text(
              "Welcom",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Sign in to enter the app",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontFamily: manrope,
                  wordSpacing: 1.5,
                  letterSpacing: 1.5),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CommonBtn(
                label: 'Sign In',
                voidCallback: () {
                  pushView(context, const SignInView());
                },
                color: ColorsApp.btnColor),
            const Text(
              'Or',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            CommonSignUp(
              label: 'Sign Up',
              voidCallback: () {
                pushView(context, const SignUpView());
              },
              color: const Color.fromRGBO(125, 158, 248, 100),
            ),
          ],
        ),
      ),
    );
  }
}
