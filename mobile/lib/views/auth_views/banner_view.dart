import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';

import '/utils/rests/banner.dart';
import '/utils/rests/handle_push_view.dart';

import 'welcome_view.dart';

class BannerView extends StatefulWidget {
  const BannerView({super.key});

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
   final List<Introduction> list = [
    Introduction(
      title: 'Self Learning',
      subTitle: 'Anywhere, anytime.',
      imageUrl: banner1,
    ),
    Introduction(
      title: 'Research',
      subTitle: 'Make your point',
      imageUrl: banner2
    ),
    Introduction(
      title: 'Sharing',
      subTitle: 'Share to socail',
      imageUrl: banner3
    ),
  ];
  @override
  Widget build(BuildContext context) {
   return IntroScreenOnboarding(
      backgroudColor: Colors.white,
      
      introductionList: list,
      onTapSkipButton: () {
        pusReplaceView(context, const WelcomeView());
      },
    );
  }
}
