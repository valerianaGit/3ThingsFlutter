import 'calendar_day.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/moor.dart';
//part 'moor_db.g.dart';

@j.JsonSerializable()
class Fear {
  int? id;
  int?
      dateID; //CalendarDay date; //DateTime.now(); // store date only, not time
  String define;
  String actions;
  String stillAlright;

  Fear(
      {this.id,
      this.dateID,
      this.define = '',
      this.actions = '',
      this.stillAlright = ''});

  static final columns = ["id", "define", "actions", "stillAlright", "dateID"];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['define'] = define;
    map['actions'] = actions;
    map['stillAlright'] = stillAlright;
    map['dateID'] = dateID;
    //if (id != null) { // took this out because id is required
    map['id'] = id;
    //}
    return map;
    //   return {
    //     'define' : define,
    //  'actions' : actions,
    //   'stillAlright': stillAlright,
    //   'date': date,
    //   'id':id
    //   };
  }

  static fromMap(Map map) {
    //<String, dynamic>
    return Fear(
        id: map["id"],
        define: map["define"],
        actions: map["actions"],
        stillAlright: map["stillAlright"],
        dateID: map["dateID"]); //DateTime.parse(map["date"])
  }

  // Implement toString to make it easier to see information about
  // each fear when using the print statement.
  @override
  String toString() {
    return 'Fear{id: $id, define: $define, actions: $actions, stillAlright: $stillAlright, dateID: $dateID}';
  }

  /// implement converter to be used in serializable
  // factory Fear.fromJson(Map<String, dynamic> json) => _$FearFromJson(json);
  // Map<String, dynamic> toJson() => _$FearToJson(this);
}

// class FearConverter extends TypeConverter<Fear, String> {
//   const FearConverter();
//   @override
//   Fear? mapToDart(String? fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return Fear.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String? mapToSql(Fear? value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }

//Implement converter to store the converted Fear lists in calendar day
/**You can use a TypeConverter for this. In your case, you can write a class ListInColumnConverter 
   * extends TypeConverter<List<String>, String> that uses json.encode and json.decode to read and write lists. */
///store list of fears as strings
/////A value of type 'List<Fear>' can't be returned from the constructor 'Fear.fromJsonList' because it has a return type of 'Fear'
List<Fear> fearsFromJson(String str) =>
    List<Fear>.from(json.decode(str).map((x) => Fear.fromMap(x)));

String fearsToJson(List<Fear> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

/// Store a list of Fear objects
class FearListColumnConverter extends TypeConverter<List<Fear>, String> {
  const FearListColumnConverter();
  @override
  List<Fear>? mapToDart(String? fromDb) {
    if (fromDb == null) {
      return null;
    }
    return fearsFromJson(fromDb);
  }

  @override
  String? mapToSql(List<Fear>? value) {
    if (value == null) {
      return null;
    }
    return fearsToJson(value);
  }
}
