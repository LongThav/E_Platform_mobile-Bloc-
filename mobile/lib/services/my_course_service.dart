import 'package:mobile/data/network/base_api_service.dart';
import 'package:mobile/data/network/network_api_service.dart';
import 'package:mobile/utils/rests/get_header.dart';
import 'package:mobile/utils/rests/url_base.dart';

import '../db_helpers/catch_signup.dart';
import '../models/course/list_course_model.dart';

class MyCourseService {
  BaseApiService _apiService = NetworkApiService();
  final CatchAuth _catchAuth = CatchAuth();

  Future<CourseModel> readCourseService() async {
    try {
      String token = await _catchAuth.readToken();
      String url = mainUrl + allCourse;
      dynamic response = await _apiService.getGetApiResponse(url,
          requestHeaders: getHeaders(token));
      return CourseModel.fromJson(response);
    } catch (err) {
      throw Exception("Error: $err");
    }
  }
}
