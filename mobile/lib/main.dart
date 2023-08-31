import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/logics/mentor_logic.dart';
import 'package:mobile/services/home_service.dart';
import 'package:mobile/services/mentor_service.dart';
import 'package:mobile/services/my_course_service.dart';

import '/logics/profile_logic.dart';
import '/services/auth_sevice.dart';
import '/services/profie_service.dart';
import 'logics/auth_logic.dart';
import 'logics/home_logic.dart';
import 'logics/my_course_logic.dart';
import 'views/splash_view.dart';

void main() {
  debugPrint("Start...!");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  AuthService authService = AuthService();
  ProfileService profileService = ProfileService();
  MentorService mentorService = MentorService();
  MyCourseService courseService = MyCourseService();
  HomeService homeService = HomeService();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AuthLogic>(create: (context) => AuthLogic(authService)),
        BlocProvider<ProfileLogic>(
            create: (context) => ProfileLogic(profileService)),
        BlocProvider<MentorLogic>(
            create: (context) => MentorLogic(mentorService)),
        BlocProvider<MyCourseLogic>(
            create: (context) => MyCourseLogic(courseService)),
        BlocProvider<HomeLogic>(create: (context) => HomeLogic(homeService)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      )));
}
