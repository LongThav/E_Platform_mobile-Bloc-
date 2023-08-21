import 'package:flutter/material.dart';
import 'package:mobile/db_helpers/catch_signup.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/views/auth_views/banner_view.dart';
import 'package:mobile/views/dashboard_views/index_view.dart';
import '../../utils/rests/handle_push_view.dart';

import '../utils/constants/img_static.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  CatchAuth catchAuth = CatchAuth();
  void init() async {
    String token = await catchAuth.readToken();
    "Token: $token".log();
    if (token == catchAuth.noToken){
      pusReplaceView(context, BannerView());
    } else {
      pusReplaceView(context, IndexView());
    }
  }
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage(splash), fit: BoxFit.fill)),
      ),
    );
  }
}
