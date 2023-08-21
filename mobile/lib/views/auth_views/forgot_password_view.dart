import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/snack_bar.dart';
import '/logics/auth_logic.dart';

import '../../commons/common_form.dart';
import '../../utils/constants/font_app.dart';

import '../../utils/rests/handle_push_view.dart';
import '../../utils/constants/img_static.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailCtrl = TextEditingController();

  @override
  void initState() {
    // ignore: invalid_use_of_visible_for_testing_member
    context.read<AuthLogic>().emit(UserForgotPasswordCheckLoading(true));
    super.initState();
  }

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // ignore: invalid_use_of_visible_for_testing_member
            context.read<AuthLogic>().emit(SetLoadingUserSignIn(true));
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
              height: height * 0.38,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(forgotPassword),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[700]),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Enter your email address",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              "Below to reset your password",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            CommonForm(value: _emailCtrl, label: 'Email'),
            SizedBox(
              height: height * 0.02,
            ),
            _buildBtn()
          ],
        ),
      ),
    );
  }

  Widget _buildBtn() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (_emailCtrl.text.isEmpty) {
          snackBar(context, "Please input your email");
        } else {
          context
              .read<AuthLogic>()
              .add(UserForgotPasswordEvent(_emailCtrl.text, context));
        }
      },
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
          child: BlocBuilder<AuthLogic, UserState>(
            builder: (contest, state) {
              if (state is UserForgotPasswordCheckLoading == true) {
                "be true".log();
                return Text(
                  "Send to Email",
                  style: const TextStyle(
                      fontFamily: manrope,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1),
                );
              } else if (state is UserForgotPasswordCheckLoading == false) {
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
