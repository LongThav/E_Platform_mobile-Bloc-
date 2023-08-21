import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:mobile/db_helpers/cache_profile.dart';
import 'package:mobile/db_helpers/catch_signup.dart';
import 'package:mobile/models/auth_models/sign_in_model.dart';

import 'package:mobile/models/auth_models/sign_up_model.dart';
import 'package:mobile/utils/rests/get_header.dart';
import 'package:mobile/utils/rests/logger.dart';
import '../utils/rests/url_base.dart';

class AuthService {
  CatchAuth catchAuth = CatchAuth();

  SignUpModel signUpModel = SignUpModel(data: SignUp(user: User()));
  SignInModel signInModel = SignInModel(login: Login(userLogin: UserLogin()));

  Future<SignUpModel> singUpService(
      String username, String email, String password) async {
    try {
      String url = mainUrl + signUp;
      Map<String, dynamic> map = {
        "username": username,
        "email": email,
        "password": password
      };
      http.Response response = await http.post(Uri.parse(url), body: map);
      "Response data: ${response.body}".log();
      if (response.statusCode == 200) {
        "Response Success".log();
        catchAuth.writeInfoUser(response.body);
        signUpModel = await compute(signUpModelFromJson, response.body);
      } else {
        "Other error".log();
      }
    } catch (err) {
      "Error catch in service: $err".log();
    }
    return signUpModel;
  }

  CacheProfile cacheProfile = CacheProfile();

  Future<bool> loginService(
      String email, String password, BuildContext context) async {
    try {
      final Map<String, dynamic> map = {"email": email, "password": password};
      "Map: $map".log();
      String url = mainUrl + signIn;
      http.Response response = await http.post(Uri.parse(url), body: map);
      "Response Body: ${response.body}".log();
      if (response.statusCode == 200) {
        // catchAuth.writeKeyUserSignIn(response.body);
        signInModel = await compute(signInModelFromJson, response.body);
        catchAuth.writeToken(signInModel.login.token);
        cacheProfile.writeName(signInModel.login.userLogin.username);
        cacheProfile.writeEmail(signInModel.login.userLogin.email);
        cacheProfile.writeImage(signInModel.login.userLogin.image ?? "noImage");
        cacheProfile.writeId(signInModel.login.userLogin.id.toString());
        return true;
      } else {
        "Other error".log();
        return false;
      }
    } catch (err) {
      // "Error in catch: $err".log();
      return false;
    }
  }

  Future<void> logoutService() async {
    try {
      String token = await catchAuth.readToken();
      "Token: $token".log();
      String url = mainUrl + "/log-out";
      http.Response response =
          await http.post(Uri.parse(url), headers: getHeaders(token));
      if (response.statusCode == 200) {
        "Log out successfully".log();
      } else {
        "Other error".log();
      }
    } catch (err) {
      "Error: $err".log();
    }
  }

  Future<bool> forgotPasswordService(String email) async {
    try {
      final Map<String, dynamic> map = {
        "email": email,
      };
      String url = mainUrl + forgotPassword;
      http.Response response = await http.post(Uri.parse(url), body: map);
      "Reponse Body: ${response.body}".log();
      if (response.statusCode == 200) {
        "Respone true".log();
        return true;
      } else {
        "Other error".log();
        return false;
      }
    } catch (err) {
      "Error in catch service: $err".log();
      return false;
    }
  }

  Future<bool> verifyPinService(String code, String email) async {
    try {
      final Map<String, dynamic> map = {"email": email, "token": code};
      "Map: $map".log();
      String url = mainUrl + verifyPin;
      http.Response response = await http.post(Uri.parse(url), body: map);
      "Response Body: ${response.body}".log();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      "Error in catch: $err".log();
      return false;
    }
  }

  Future<bool> resendPin(String code, String email) async {
    try {
      final Map<String, dynamic> map = {"email": email, "code": code};
      String url = mainUrl + "/resend-pin";
      http.Response response = await http.post(Uri.parse(url), body: map);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      "Error in catch: $err".log();
      return false;
    }
  }

  Future<bool> resetPasswordService(
      String email, String password, String passwordConfirm) async {
    try {
      final Map<String, dynamic> map = {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirm
      };
      "Map: $map".log();
      String url = mainUrl + resetPassword;
      http.Response response = await http.post(Uri.parse(url), body: map);
      "Response Body: ${response.body}".log();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      "Error in catch: $err".log();
      return false;
    }
  }
}

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));
SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));
