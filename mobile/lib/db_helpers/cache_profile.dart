import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheProfile{
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();
  String keyName = "name";
  String noName = "noName";

  String keyEmail = "email";
  String noEmail = "noEmail";

  String keyImage = "Image";
  String noImage = "noImage";
  String keyId = "id";
  String noId = "noId";
  
  void writeId(String value){
    _flutterSecureStorage.write(key: keyId, value: value);
  }

  Future<String> getId()async{
    String? userId = await _flutterSecureStorage.read(key: keyId);
    return userId ?? noId;
  }

  void writeName(String value){
    _flutterSecureStorage.write(key: keyName, value: value);
  }
  
  Future<String> getName()async{
    String? name = await _flutterSecureStorage.read(key: keyName);
    return name ?? noName;
  }

  void writeEmail(String value){
    _flutterSecureStorage.write(key: keyEmail, value: value);
  }
  Future<String> getEmail()async{
    String? email = await _flutterSecureStorage.read(key: keyEmail);
    return email ?? noEmail;
  }

  void writeImage(String value){
    _flutterSecureStorage.write(key: keyImage, value: value);
  }

  Future<String> getImage()async{
    String? image = await _flutterSecureStorage.read(key: keyImage);
    return image ?? noImage;
  }

  void deleteAll(){
    _flutterSecureStorage.deleteAll();
  }
}