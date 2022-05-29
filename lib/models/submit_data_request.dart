class SubmitDataRequest {
  SubmitDataRequest({
    String? name,
    int? uid,
    String? latitude,
    String? longitude,
    int? requestId,
  }) {
    _name = name;
    _uid = uid;
    _latitude = latitude;
    _longitude = longitude;
    _requestId = requestId;
  }

  SubmitDataRequest.fromJson(dynamic json) {
    _name = json['name'];
    _uid = json['uid'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _requestId = json['request_id'];
  }

  String? _name;
  int? _uid;
  String? _latitude;
  String? _longitude;
  int? _requestId;

  SubmitDataRequest copyWith({
    String? name,
    int? uid,
    String? latitude,
    String? longitude,
    int? requestId,
  }) =>
      SubmitDataRequest(
        name: name ?? _name,
        uid: uid ?? _uid,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        requestId: requestId ?? _requestId,
      );

  String? get name => _name;

  int? get uid => _uid;

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  int? get requestId => _requestId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['uid'] = _uid;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['request_id'] = _requestId;
    return map;
  }
}
