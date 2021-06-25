import 'calendar_day.dart';

class Ground {
  int? id;
  DateTime date; //CalendarDay date; // store date only, not time

  Ground({this.id, required this.date});

  static final columns = ["id", "date"];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map['date'] = date;
    return map;
  }

  static fromMap(Map<String, dynamic> map) {
    return Ground(id: map["id"], date: map["date"]);
  }

  @override
  String toString() {
    return 'Ground{id: $id, date: $date}';
  }
}
