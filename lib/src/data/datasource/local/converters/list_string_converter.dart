import 'dart:convert';

import 'package:floor/floor.dart';

class ListStringConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    var json = jsonDecode(databaseValue);
    return List<String>.from(json['categories']);
  }

  @override
  String encode(List<String> value) {
    var map = <String, List<String>>{};
    map.addAll({'categories': value});
    return jsonEncode(map);
  }
}
