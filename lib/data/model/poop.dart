
class PoopEntity {
  int? code;
  String? message;
  List<Result>? result;

  PoopEntity({this.code, this.message, this.result});

  PoopEntity.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["result"] is List) {
      result = json["result"] == null ? null : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["message"] = message;
    if(result != null) {
      _data["result"] = result?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Result {
  int? id;
  int? userId;
  String? poopTime;

  Result({this.id, this.userId, this.poopTime});

  Result.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["userId"] is int) {
      userId = json["userId"];
    }
    if(json["poopTime"] is String) {
      poopTime = json["poopTime"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["userId"] = userId;
    _data["poopTime"] = poopTime;
    return _data;
  }
}