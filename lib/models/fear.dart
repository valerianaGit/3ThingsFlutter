import 'calendar_day.dart';

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
      required this.define,
      required this.actions,
      required this.stillAlright});

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
}
