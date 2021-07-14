import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'gratitude.dart';
import 'fear.dart';

class CalendarDay {
  int? id;
  DateTime date;
  List<Gratitude>? gratitudeArray;
  // for these lists, I'll need to serialize into JSON string to be stored in SQLite
  List<Fear>? fearArray;
  bool? groundBool;

  CalendarDay(
      {this.id,
      required this.date,
      this.gratitudeArray,
      this.fearArray,
      this.groundBool});

  static final columns = [
    'id',
    'date',
    'gratitude_array',
    'fear_array',
    'ground_bool'
  ];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['date'] =
        date.millisecondsSinceEpoch; // to integer millisecond since 1970
    map['gratitude_array'] =
        jsonEncode(gratitudeArray); //SERIALIZE THE ARRAYS INTO JSON strings
    map['fear_array'] =
        jsonEncode(fearArray); //SERIALIZE THE ARRAYS INTO JSON strings
    map['ground_bool'] = groundBool;
    return map;
  }

  static fromMap(Map map) {
    return CalendarDay(
        id: map['id'],
        date: DateTime.fromMillisecondsSinceEpoch(
            map['date']), // jsonDecode(map['date']),
        gratitudeArray: jsonDecode(
            map['gratitude_array']), //Deserialize JSON strings into arrays
        fearArray: jsonDecode(
            map['fear_array']), //Deserialize JSON strings into arrays
        groundBool: map['ground_bool']);
  }

  @override
  String toString() {
    return 'CalendarDay{id: $id, date: $date, gratitude_array: $gratitudeArray, fear_array: $fearArray, ground_bool: $groundBool}';
  }
}
