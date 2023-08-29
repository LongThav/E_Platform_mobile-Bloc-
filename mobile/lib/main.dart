import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/logics/profile_logic.dart';
import '/services/auth_sevice.dart';
import '/services/profie_service.dart';
import 'logics/auth_logic.dart';
import 'views/splash_view.dart';

void main() {
  debugPrint("Start...!");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  AuthService authService = AuthService();
  ProfileService profileService = ProfileService();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<AuthLogic>(create: (context) => AuthLogic(authService)),
        BlocProvider<ProfileLogic>(
            create: (context) => ProfileLogic(profileService)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      )));
}
