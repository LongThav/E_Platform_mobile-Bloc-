import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/db_helpers/cache_profile.dart';
import 'package:mobile/db_helpers/catch_signup.dart';
import 'package:mobile/models/auth_models/local_model.dart';
import 'package:mobile/models/profile_model.dart';
import 'package:mobile/models/update_profile_model.dart';
import 'package:mobile/utils/rests/get_header.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/url_base.dart';

class ProfileService {
  LocalModel _localModel = LocalModel(login: Login(userLogin: UserLogin()));
  final CatchAuth _catchAuth = CatchAuth();

  Future readLocalLogin() async {
    try {
      var cache = await _catchAuth.readKeyUserSignIn();
      "Cache: $cache".log();
      if (cache == _catchAuth.noKeyUserSignIn) {
        "Cache has been error".log();
      } else {
        _localModel = await compute(pareLocalJson, cache);
      }
    } catch (err) {
      "Error in cache response: $err".log();
    }
    return _localModel;
  }


  CacheProfile cacheProfile = CacheProfile();
  UpdateProfileModel updateProfileModel = UpdateProfileModel(user: UserUpdate());

  Future<bool> updateProfileService(String username, String email, String image, int id)async{
    try{
      String url = mainUrl + updateProfile;
      String token = await _catchAuth.readToken();
      "Token User: $token".log();
      final Map<String,dynamic> map = {
        "username": username,
        "email": email,
        "image": image,
        "id": id
      };
      var body = jsonEncode(map);
      http.Response response = await http.put(Uri.parse(url), body: body, headers: getHeaders(token));
      "Response Body: ${response.body}".log();
      if(response.statusCode == 200){
        updateProfileModel = await compute(pareJsonUpdateProfileUser, response.body);
        var data = updateProfileModel.user;
        cacheProfile.writeName(data.username);
        cacheProfile.writeEmail(data.email);
        cacheProfile.writeImage(data.image);
        "Update successfully".log();
        // cacheProfile.writeId(data.id.toString());
        return true;
      }else{
        return false;
      }
    }catch(err){
      "Error Response in catch: $err".log();
      return false;
    }
  }

  late ProfileModel profileModel;
  Future<ProfileModel> getProfileService(int id)async{
    try{
      String token = await _catchAuth.readToken();
      String url = mainUrl + getProfile + '/$id';
      "Url: $url".log();
      http.Response response = await http.get(Uri.parse(url), headers: getHeaders(token));
      "Response Body: ${response.body}".log();
      if(response.statusCode == 200){
        profileModel = await compute(parJsonProfile, response.body);
      }else{
        "Other error".log();
      }
    }catch(err){
      "Error in catch service: $err".log();
    }
    return profileModel;
  }
}

LocalModel pareLocalJson(dynamic str) => LocalModel.fromJson(json.decode(str));
ProfileModel parJsonProfile(String str) => ProfileModel.fromJson(json.decode(str));
UpdateProfileModel pareJsonUpdateProfileUser(String str) => UpdateProfileModel.fromJson(json.decode(str));