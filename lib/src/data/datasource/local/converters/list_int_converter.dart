import 'dart:convert';

import 'package:floor/floor.dart';

class ListIntConverter extends TypeConverter<List<int>,String>{
  @override
  List<int> decode(String databaseValue) {
    var json = jsonDecode(databaseValue);
    return List<int>.from(json['genre_ids']);
  }

  @override
  String encode(List<int> value) {
    var map = <String,dynamic>{};
    map.addAll({'genre_ids':value});
    return jsonEncode(map);
  }

}
