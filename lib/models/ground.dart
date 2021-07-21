import 'calendar_day.dart';

class Ground {
  int? id;
  int? dateID; //CalendarDay date; // store date only, not time
  bool meditate;

  Ground({this.id, this.dateID, this.meditate = false});

  static final columns = ["id", "dateID"];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['dateID'] = dateID;
    return map;
  }

  static fromMap(Map map) {
    return Ground(
        id: map["id"], dateID: map["dateID"]); //DateTime.parse(map["dateID"]));
  }

  @override
  String toString() {
    return 'Ground{id: $id, date: $dateID}';
  }
}
