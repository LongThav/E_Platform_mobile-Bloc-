import 'package:mobile/data/network/base_api_service.dart';
import 'package:mobile/data/network/network_api_service.dart';
import 'package:mobile/models/home_models/skill_develop_by_id_model.dart';
import 'package:mobile/models/home_models/skill_develop_model.dart';
import 'package:mobile/utils/rests/get_header.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/url_base.dart';

import '../db_helpers/catch_signup.dart';

class HomeService{
  BaseApiService _apiService = NetworkApiService();
  final CatchAuth _catchAuth = CatchAuth();

  Future<SkillDevModel> readSkillDevService()async{
    try{
      String token = await _catchAuth.readToken();
      String url = mainUrl + getAllSkill;
      dynamic response = await _apiService.getGetApiResponse(url, requestHeaders: getHeaders(token));
      return SkillDevModel.fromJson(response);
    }catch(err){
      throw Exception(err);
    }
  }

  Future<SkillDevByIdModel> readSkillDevByIdService(int id)async{
    try{
      String token = await _catchAuth.readToken();
      String url = mainUrl + getSkillById + '/$id';
      dynamic response = await _apiService.getGetApiResponse(url, requestHeaders: getHeaders(token));
      "Response: $response".log();
      return SkillDevByIdModel.fromJson(response);
    }catch(err){
      "Error: $err".log();
      throw Exception(err);
    }
  }
}