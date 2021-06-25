import 'calendar_day.dart';

class Gratitude {
  int? id;
  DateTime date; //CalendarDay date; // store date only, not time
  String entry1;
  String entry2;
  String entry3;

  Gratitude(
      {this.id,
      required this.date,
      required this.entry1,
      required this.entry2,
      required this.entry3});

  static final columns = ["id", "date", "entry1", "entry2", "entry3"];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['entry1'] = entry1;
    map['entry2'] = entry2;
    map['entry3'] = entry3;
    map['date'] = date;
    map['id'] = id;
    return map;
  }

  static fromMap(Map<String, dynamic> map) {
    return Gratitude(
        id: map["id"],
        entry1: map["entry1"],
        entry2: map["entry2"],
        entry3: map["entry3"],
        date: map["date"]);
  }

  @override
  String toString() {
    return 'Gratitude{id: $id, entry1: $entry1, entry2: $entry2, entry3: $entry3, date: $date}';
  }
}
