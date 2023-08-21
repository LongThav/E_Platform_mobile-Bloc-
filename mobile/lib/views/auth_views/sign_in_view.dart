import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/auth_logic.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/snack_bar.dart';
import '../../utils/constants/color_app.dart';
import '../../utils/constants/font_app.dart';
import '../../utils/rests/handle_push_view.dart';
import '../../utils/constants/img_static.dart';
import '../../views/auth_views/signup_view.dart';
import 'forgot_password_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();

  bool _passwordObscure = true;

  @override
  void initState() {
    // ignore: invalid_use_of_visible_for_testing_member
    context.read<AuthLogic>().emit(SetLoadingUserSignIn(true));
    super.initState();
  }

  @override
  void dispose() {
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
              height: height * 0.37,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(signin),
                fit: BoxFit.fill,
              )),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Sign In",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: manrope,
                  color: Colors.grey[700],
                  letterSpacing: 1),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _emailCtrl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: ColorsApp.btnColor,
                    fontFamily: manrope,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                onPressed: () {
                  pushView(context, const ForgotPasswordView());
                },
              ),
            ),
            InkWell(
              onTap: () {
                if (_emailCtrl.text.isEmpty) {
                  snackBar(context, "Please input your email");
                } else if (_passwordCtrl.text.isEmpty) {
                  snackBar(context, "Please input your password");
                } else {
                  context.read<AuthLogic>().add(UserEventSignIn(
                        _emailCtrl.text,
                        _passwordCtrl.text,
                        context,
                      ));
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
                child: Center(child: BlocBuilder<AuthLogic, UserState>(
                  builder: (context, state) {
                    // return state is SetLoadingUserSignIn
                    //     ? Text(
                    //         "Sign In",
                    //         style: const TextStyle(
                    //             fontFamily: manrope,
                    //             fontSize: 18,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white,
                    //             letterSpacing: 1),
                    //       )
                    //     : CircularProgressIndicator(
                    //         color: Colors.white,
                    //       );
                    "Start Loading".log();
                    if (state is SetLoadingUserSignIn == true) {
                      "Login success".log;
                      return Text(
                        "Sign IN",
                        style: const TextStyle(
                            fontFamily: manrope,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1),
                      );
                    } else if (state is SetLoadingUserSignIn == false) {
                      "Loading btn".log();
                      return CupertinoActivityIndicator(
                        color: Colors.white,
                        animating: true,
                      );
                    } else {
                      return Container();
                    }
                  },
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontFamily: manrope,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                TextButton(
                    onPressed: () {
                      pushView(context, const SignUpView());
                    },
                    child: const Text(
                      "Sing Up",
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
