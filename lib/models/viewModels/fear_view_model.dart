import 'package:flutter/cupertino.dart';
import 'package:three_things_flutter/models/calendar_day.dart';

import 'dart:collection';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/services/database_client.dart';

class FearViewModel extends ChangeNotifier {
  final List<Fear> _fearsList = [
    // Fear(
    //     date: DateTime.now(),
    //     define: 'dying',
    //     actions: 'not really much',
    //     stillAlright: 'Does it matter in the grand scheme of things?')
  ];
  UnmodifiableListView<Fear> get fearsList {
    return UnmodifiableListView(_fearsList);
  }

  int get fearsCount {
    return _fearsList.length;
  }

  // void addAnotherFear(CalendarDay day, Fear fear) {
  //   DatabaseClient().upsertCalendarDayFearListAndFearTable(day, fear);
  //   // Fear newFear = Fear(
  //   //     //date: fear.date,
  //   //     define: fear.define,
  //   //     actions: fear.actions,
  //   //     stillAlright: fear.stillAlright);
  //   // _fearsList.add(newFear);
  //   // print(_fearsList);
  //   notifyListeners();
  // }
}
