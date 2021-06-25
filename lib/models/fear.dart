import 'calendar_day.dart';

class Fear {
  int? id;
  DateTime
      date; //CalendarDay date; //DateTime.now(); // store date only, not time
  String define;
  String actions;
  String stillAlright;

  Fear(
      {this.id,
      required this.date,
      required this.define,
      required this.actions,
      required this.stillAlright});

  static final columns = ["id", "define", "actions", "stillAlright", "date"];

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['define'] = define;
    map['actions'] = actions;
    map['stillAlright'] = stillAlright;
    map['date'] = date;
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

  static fromMap(Map<String, dynamic> map) {
    return Fear(
        id: map["id"],
        define: map["define"],
        actions: map["actions"],
        stillAlright: map["stillAlright"],
        date: map["date"]);
    // fear.id = map["id"];
    // fear.define = map["define"];
    // fear.actions = map["actions"];
    // fear.stillAlright = map["stillAlright"];
    // fear.date = map["date"];
    // return fear;
  }

  // Implement toString to make it easier to see information about
  // each fear when using the print statement.
  @override
  String toString() {
    return 'Fear{id: $id, define: $define, actions: $actions, stillAlright: $stillAlright, date: $date}';
  }
}
