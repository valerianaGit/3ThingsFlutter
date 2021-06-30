import 'calendar_day.dart';

class Gratitude {
  int? id;
  int? dateID; //CalendarDay date; // store date only, not time
  String entry1;
  String entry2;
  String entry3;

  Gratitude(
      {this.id,
      this.dateID,
      required this.entry1,
      required this.entry2,
      required this.entry3});

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
}
