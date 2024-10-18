
class UserEntity {
  int? code;
  String? message;
  Result? result;

  UserEntity({this.code, this.message, this.result});

  UserEntity.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if(result != null) {
      _data["result"] = result?.toJson();
    }
    return _data;
  }
}

class Result {
  int? id;
  String? code;
  String? name;
  String? password;

  Result({this.id, this.code, this.name, this.password});

  Result.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["password"] = password;
    return _data;
  }
}