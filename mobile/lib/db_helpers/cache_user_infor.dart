import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/utils/rests/logger.dart';

class CacheUserInfor{
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  String keyUser = "user";
  String noKeyUser = "noKey";

  void writeKeyUser(String value){
    "Key Value: $value".log();
    _flutterSecureStorage.write(key: keyUser, value: value);
  }

  Future<String> getUser()async{
    String? user = await _flutterSecureStorage.read(key: keyUser);
    "User: $user".log();
    return user ?? keyUser;
  }
}