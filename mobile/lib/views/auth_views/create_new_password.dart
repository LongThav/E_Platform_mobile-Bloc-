import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/auth_logic.dart';

import '../../commons/common_btn.dart';
import '../../utils/constants/color_app.dart';
import '../../utils/constants/font_app.dart';

import '../../utils/rests/handle_push_view.dart';
import '../../utils/constants/img_static.dart';
import 'password_reset_successfully_view.dart';

class CreateNewPasswordNew extends StatefulWidget {
  final String email;
  const CreateNewPasswordNew({super.key, required this.email});

  @override
  State<CreateNewPasswordNew> createState() => _CreateNewPasswordNewState();
}

class _CreateNewPasswordNewState extends State<CreateNewPasswordNew> {
  final TextEditingController _newPasswordCtrl = TextEditingController();
  final TextEditingController _confirmCtrl = TextEditingController();

  bool _passwordObscure = true;
  bool _confirmObsecur = true;

  @override
  void dispose() {
    _newPasswordCtrl.dispose();
    _confirmCtrl.dispose();
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
                image: AssetImage(createNewPassword),
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Create New Password",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: manrope,
                  color: Colors.grey[700]),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              "Your new password must be",
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
              "different from previous used password",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _newPasswordCtrl,
                obscuringCharacter: '*',
                obscureText: _passwordObscure,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordObscure = !_passwordObscure;
                          });
                        },
                        icon: Icon(
                          _passwordObscure
                              ? Icons.face
                              : Icons.face_unlock_outlined,
                          color: _passwordObscure
                              ? const Color(0XFFCACACA)
                              : const Color(0XFF343434),
                        )),
                    hintText: 'Set New Password',
                    hintStyle: const TextStyle(
                        fontFamily: manrope,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                scrollPadding: const EdgeInsets.all(0),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _confirmCtrl,
                obscuringCharacter: '*',
                obscureText: _confirmObsecur,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _confirmObsecur = !_confirmObsecur;
                          });
                        },
                        icon: Icon(
                          _confirmObsecur
                              ? Icons.face
                              : Icons.face_unlock_outlined,
                          color: _confirmObsecur
                              ? const Color(0XFFCACACA)
                              : const Color(0XFF343434),
                        )),
                    hintText: 'Confirm Password',
                    hintStyle: const TextStyle(
                        fontFamily: manrope,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                scrollPadding: const EdgeInsets.all(0),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CommonBtn(
                label: 'Reset Password',
                voidCallback: () {
                  // pushView(context, const PasswordResetSuccessfullyView());
                  context.read<AuthLogic>().add(UserResetPasswordEvent(widget.email, _newPasswordCtrl.text, _confirmCtrl.text, context));
                },
                color: ColorsApp.btnColor)
          ],
        ),
      ),
    );
  }
}
