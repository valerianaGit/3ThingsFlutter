import 'calendar_day.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/moor.dart';
//part 'moor_db.g.dart';

// STEP 1 import statements and add an annotation
// for j.JSONSerializable at the top of the data model class
@j.JsonSerializable()
class Gratitude {
  int? id;
  int? dateID; //CalendarDay date; // store date only, not time
  String entry1;
  String entry2;
  String entry3;

  Gratitude(
      {this.id,
      this.dateID,
      this.entry1 = '',
      this.entry2 = '',
      this.entry3 = ''});

  static final columns = ["id", "dateID", "entry1", "entry2", "entry3"];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['entry1'] = entry1;
    map['entry2'] = entry2;
    map['entry3'] = entry3;
    map['dateID'] = dateID;
    map['id'] = id;
    return map;
  }

  static fromMap(Map map) {
    return Gratitude(
        id: map["id"],
        entry1: map["entry1"],
        entry2: map["entry2"],
        entry3: map["entry3"],
        dateID: map["dateID"]); // DateTime.parse(map["dateID"]));
  }

  @override
  String toString() {
    return 'Gratitude{id: $id, entry1: $entry1, entry2: $entry2, entry3: $entry3, dateID: $dateID}';
  }

  ///STEP 2 -  implement converter to be used in serializable. FOR SINGLE Gratitude entries
  // factory Gratitude.fromJson(Map<String, dynamic> json) =>
  //     _$GratitudeFromJson(json);
  // Map<String, dynamic> toJson() => _$GratitudeToJson(this);
}

//STEP 3 - CREATE type converter class  to tell MOOR how to
// for single gratitude storage in the database
// class GratitudeConverter extends TypeConverter<Gratitude, String> {
//   const GratitudeConverter();
//   @override
//   Gratitude? mapToDart(String? fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return Gratitude.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String? mapToSql(Gratitude? value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }

// STEP 4 - Create converter class for List Gratitude storage, this is the one we actually use
List<Gratitude> gratitudesFromJson(String str) =>
    List<Gratitude>.from(json.decode(str).map((x) => Gratitude.fromMap(x)));

String gratitudesToJson(List<Gratitude> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

/// Store a list of Fear objects
class GratitudeListColumnConverter
    extends TypeConverter<List<Gratitude>, String> {
  const GratitudeListColumnConverter();
  @override
  List<Gratitude>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return gratitudesFromJson(fromDb);
  }

  @override
  String? mapToSql(List<Gratitude>? value) {
    if (value == null) {
      return null;
    }
    return gratitudesToJson(value);
  }
}
