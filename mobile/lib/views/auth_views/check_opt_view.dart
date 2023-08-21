import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/auth_logic.dart';
import 'package:mobile/utils/rests/logger.dart';

import '../../commons/common_btn.dart';
import '../../utils/constants/color_app.dart';
import '../../utils/constants/font_app.dart';

import '../../utils/rests/handle_push_view.dart';
import '../../utils/constants/img_static.dart';

class CheckOTPView extends StatefulWidget {
  final String email;
  const CheckOTPView({super.key, required this.email});

  @override
  State<CheckOTPView> createState() => _CheckOTPViewState();
}

class _CheckOTPViewState extends State<CheckOTPView> {
  final TextEditingController _codeIndex1Ctrl = TextEditingController();
  final TextEditingController _codeIndex2Ctrl = TextEditingController();
  final TextEditingController _codeIndex3Ctrl = TextEditingController();
  final TextEditingController _codeIndex4Ctrl = TextEditingController();
  final TextEditingController _codeIndex5Ctrl = TextEditingController();
  final TextEditingController _codeIndex6Ctrl = TextEditingController();
  @override
  void dispose() {
    _codeIndex1Ctrl.dispose();
    _codeIndex2Ctrl.dispose();
    _codeIndex3Ctrl.dispose();
    _codeIndex4Ctrl.dispose();
    _codeIndex5Ctrl.dispose();
    _codeIndex6Ctrl.dispose();
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
              height: height * 0.35,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(verifyOtp),
                fit: BoxFit.cover,
              )),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const Text(
              "Check Email For OTP",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            const Text(
              "To reset your password, please ",
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
              "entire the 4 digit pin sent to your email.",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: manrope,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            _buildfrmOpt(),
            CommonBtn(
                label: 'Continue',
                voidCallback: () {
                  String code = _codeIndex1Ctrl.text +
                      _codeIndex2Ctrl.text +
                      _codeIndex3Ctrl.text +
                      _codeIndex4Ctrl.text +
                      _codeIndex5Ctrl.text +
                      _codeIndex6Ctrl.text;
                  "Code: $code".log();
                  context
                      .read<AuthLogic>()
                      .add(UserVerifyPinEvent(widget.email, code, context));
                },
                color: ColorsApp.btnColor)
          ],
        ),
      ),
    );
  }

  Widget _buildfrmOpt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 48,
          width: 44,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _codeIndex1Ctrl,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 48,
          width: 44,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _codeIndex2Ctrl,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 48,
          width: 44,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _codeIndex3Ctrl,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 48,
          width: 44,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _codeIndex4Ctrl,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 48,
          width: 44,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _codeIndex5Ctrl,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 48,
          width: 44,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              border: Border.all(
                  width: 1, color: const Color.fromRGBO(0, 0, 0, 0.25)),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: _codeIndex6Ctrl,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.titleLarge,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
