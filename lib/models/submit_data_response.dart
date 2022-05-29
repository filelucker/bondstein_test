class SubmitDataResponse {
  SubmitDataResponse({
    int? code,
    String? appMessage,
    String? userMessage,
    Data? data,
  }) {
    _code = code;
    _appMessage = appMessage;
    _userMessage = userMessage;
    _data = data;
  }

  SubmitDataResponse.fromJson(dynamic json) {
    _code = json['code'];
    _appMessage = json['app_message'];
    _userMessage = json['user_message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  int? _code;
  String? _appMessage;
  String? _userMessage;
  Data? _data;

  SubmitDataResponse copyWith({
    int? code,
    String? appMessage,
    String? userMessage,
    Data? data,
  }) =>
      SubmitDataResponse(
        code: code ?? _code,
        appMessage: appMessage ?? _appMessage,
        userMessage: userMessage ?? _userMessage,
        data: data ?? _data,
      );

  int? get code => _code;

  String? get appMessage => _appMessage;

  String? get userMessage => _userMessage;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['app_message'] = _appMessage;
    map['user_message'] = _userMessage;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    String? name,
    String? uid,
    String? latitude,
    String? longitude,
    String? requestId,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) {
    _name = name;
    _uid = uid;
    _latitude = latitude;
    _longitude = longitude;
    _requestId = requestId;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _uid = json['uid'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _requestId = json['request_id'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
  }

  String? _name;
  String? _uid;
  String? _latitude;
  String? _longitude;
  String? _requestId;
  String? _updatedAt;
  String? _createdAt;
  int? _id;

  Data copyWith({
    String? name,
    String? uid,
    String? latitude,
    String? longitude,
    String? requestId,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) =>
      Data(
        name: name ?? _name,
        uid: uid ?? _uid,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        requestId: requestId ?? _requestId,
        updatedAt: updatedAt ?? _updatedAt,
        createdAt: createdAt ?? _createdAt,
        id: id ?? _id,
      );

  String? get name => _name;

  String? get uid => _uid;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  String? get requestId => _requestId;

  String? get updatedAt => _updatedAt;

  String? get createdAt => _createdAt;

  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['uid'] = _uid;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['request_id'] = _requestId;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    return map;
  }
}
