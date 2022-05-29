class StoreResponse {
  StoreResponse({
    List<Data>? data,
    Links? links,
    Meta? meta,
  }) {
    _data = data;
    _links = links;
    _meta = meta;
  }

  StoreResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _links = json['links'] != null ? Links.fromJson(json['links']) : null;
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  List<Data>? _data;
  Links? _links;
  Meta? _meta;

  StoreResponse copyWith({
    List<Data>? data,
    Links? links,
    Meta? meta,
  }) =>
      StoreResponse(
        data: data ?? _data,
        links: links ?? _links,
        meta: meta ?? _meta,
      );

  List<Data>? get data => _data;

  Links? get links => _links;

  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['links'] = _links?.toJson();
    }
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }
}

class Meta {
  Meta({
    int? currentPage,
    int? from,
    int? lastPage,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) {
    _currentPage = currentPage;
    _from = from;
    _lastPage = lastPage;
    _path = path;
    _perPage = perPage;
    _to = to;
    _total = total;
  }

  Meta.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _path = json['path'];
    _perPage = json['per_page'];
    _to = json['to'];
    _total = json['total'];
  }

  int? _currentPage;
  int? _from;
  int? _lastPage;
  String? _path;
  int? _perPage;
  int? _to;
  int? _total;

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? _currentPage,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        to: to ?? _to,
        total: total ?? _total,
      );

  int? get currentPage => _currentPage;

  int? get from => _from;

  int? get lastPage => _lastPage;

  String? get path => _path;

  int? get perPage => _perPage;

  int? get to => _to;

  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

class Links {
  Links({
    String? first,
    String? last,
    String? prev,
    String? next,
  }) {
    _first = first;
    _last = last;
    _prev = prev;
    _next = next;
  }

  Links.fromJson(dynamic json) {
    _first = json['first'];
    _last = json['last'];
    _prev = json['prev'];
    _next = json['next'];
  }

  String? _first;
  String? _last;
  String? _prev;
  String? _next;

  Links copyWith({
    String? first,
    String? last,
    String? prev,
    String? next,
  }) =>
      Links(
        first: first ?? _first,
        last: last ?? _last,
        prev: prev ?? _prev,
        next: next ?? _next,
      );

  String? get first => _first;

  String? get last => _last;

  String? get prev => _prev;

  String? get next => _next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = _first;
    map['last'] = _last;
    map['prev'] = _prev;
    map['next'] = _next;
    return map;
  }
}

class Data {
  Data({
    int? id,
    String? name,
    String? address,
  }) {
    _id = id;
    _name = name;
    _address = address;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
  }

  int? _id;
  String? _name;
  String? _address;

  Data copyWith({
    int? id,
    String? name,
    String? address,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        address: address ?? _address,
      );

  int? get id => _id;

  String? get name => _name;

  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['address'] = _address;
    return map;
  }
}
