import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/auth_logic.dart';
import 'package:mobile/utils/rests/snack_bar.dart';

import '../../commons/common_form.dart';
import '../../utils/constants/color_app.dart';
import '../../utils/constants/font_app.dart';
import '../../views/auth_views/sign_in_view.dart';

import '../../utils/rests/handle_push_view.dart';
import '../../utils/constants/img_static.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  bool _passwordObscure = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
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
              height: height * 0.36,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(signup),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: manrope),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            CommonForm(value: _nameCtrl, label: 'Name'),
            SizedBox(
              height: height * 0.03,
            ),
            CommonForm(value: _emailCtrl, label: 'Email'),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _passwordCtrl,
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
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        fontFamily: manrope,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5)),
                scrollPadding: const EdgeInsets.all(0),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: ()async {
                if (_nameCtrl.text.isEmpty) {
                  snackBar(context, "Please input your name");
                } else if (_emailCtrl.text.isEmpty) {
                  snackBar(context, "Please input your email");
                } else if (_passwordCtrl.text.isEmpty) {
                  snackBar(context, "Please input your password");
                } else {
                  context.read<AuthLogic>().add(UserEventSignUp(
                      _emailCtrl.text, _passwordCtrl.text, _nameCtrl.text,context));
                }
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: ColorsApp.opaColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(child: BlocBuilder<AuthLogic, UserState>(
                  builder: (context, state) {
                    return state is SetLoadingSingUp
                        ? CircularProgressIndicator(strokeWidth: 3,)
                        : Text(
                            "Sing Up",
                            style: const TextStyle(
                                fontFamily: manrope,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1),
                          );
                  },
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontFamily: manrope,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                TextButton(
                    onPressed: () {
                      // print("hi");
                      pushView(context, const SignInView());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: manrope, fontWeight: FontWeight.bold),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
