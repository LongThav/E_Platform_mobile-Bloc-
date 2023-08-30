import 'package:mobile/data/network/base_api_service.dart';
import 'package:mobile/data/network/network_api_service.dart';
import 'package:mobile/models/all_user_model.dart';
import 'package:mobile/utils/rests/get_header.dart';
import 'package:mobile/utils/rests/logger.dart';
import 'package:mobile/utils/rests/url_base.dart';

import '../db_helpers/catch_signup.dart';

class MentorService {
  BaseApiService _apiService = NetworkApiService();
  final CatchAuth _catchAuth = CatchAuth();

  Future<AllUserModel> fetchAllUserService() async {
    try {
      String token = await _catchAuth.readToken();
      String url = mainUrl + getAllUser;
      dynamic response = await _apiService.getGetApiResponse(url,
          requestHeaders: getHeaders(token));
      "Response data: $response".log();
      return AllUserModel.fromJson(response);
    } catch (er) {
      "Error: $er".log();
      throw Exception(er);
    }
  }
}
