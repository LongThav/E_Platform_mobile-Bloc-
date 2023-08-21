import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CatchAuth{
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  String key = "";
  String noUser = "noToken";

  void writeInfoUser(String value){
    _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String> readUserInfo()async{
    String? user = await _flutterSecureStorage.read(key: key);
    return user ?? noUser;
  }

  String token = "";
  String noToken = "noToken";

  void writeToken(String value){
    _flutterSecureStorage.write(key: token, value: value);
  }

  Future<String> readToken()async{
    String? tokenUser = await _flutterSecureStorage.read(key: token);
    return tokenUser ?? noToken;
  }

  String keyUserSignIn = "key";
  String noKeyUserSignIn = "noKey";

  void writeKeyUserSignIn(String value){
    _flutterSecureStorage.write(key: keyUserSignIn, value: value);
  }

  Future<String> readKeyUserSignIn()async{
    String? keyUser = await _flutterSecureStorage.read(key: keyUserSignIn);
    return keyUser ?? noKeyUserSignIn;
  }

  String keyId = "";
  String noKeyId = "";

  void write(String value){
    _flutterSecureStorage.write(key: keyId, value: value);
  }

  Future<String> readId()async{
    String? userId = await _flutterSecureStorage.read(key: keyId);
    return userId ?? noKeyId;
  }
  
  void deleteUserInfo(){
    _flutterSecureStorage.deleteAll();
  }
}