import 'package:flutter/cupertino.dart';
import 'package:three_things_flutter/models/calendar_day.dart';
import 'package:three_things_flutter/models/gratitude.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'dart:collection';
import 'package:three_things_flutter/services/database_client.dart';

//import 'package:three_things_flutter/models/gratitude.dart';

//how do you handle the model of a calendar?
//
//This model needs
//check to true if there have been gratitude, fear and groundings that day
//ALL PROPERTIES AND METHODS HAVE TO TAKE EACH DATE INTO ACCCOUNT, THEY SHOUD RESET FOR EVERY DYA
//
//
////SAME FOR ALL OTHERS
//bool getBoolGratitudeToday(DateTime date) {
// if (date.DATEONLY.NOTTIME.gratitudevIEWModel.listcount > 0) {
// bool gratitude today = yes;
// }
// }

class CalendarDayViewModel extends ChangeNotifier {
  //Gratitude
  ////we only need to update the list here
  final List<Gratitude> _gratitudesList = [
    Gratitude(entry1: 'family', entry2: 'baloo', entry3: 'home'),
    Gratitude(entry1: 'baby', entry2: 'house', entry3: 'running water'),
    Gratitude(entry1: 'I dont have a toothcache', entry2: '', entry3: 'home'),
  ];
  UnmodifiableListView<Gratitude> get gratitudesList {
    return UnmodifiableListView(_gratitudesList);
  }

  int get gratitudesCount {
    return _gratitudesList.length;
  }

  void addAnotherGratitude(CalendarDay day, Gratitude gratitude) {
    DatabaseClient().upsertDayGratitudeListAndGratitudeTable(day, gratitude);
    // Gratitude newGratitude = Gratitude(
    //     entry1: gratitude.entry1,
    //     entry2: gratitude.entry2,
    //     entry3: gratitude.entry3);
    // _gratitudesList.add(newGratitude);
    // print(' new entry , entry 1 ${_gratitudesList[3].entry1}');
    //This print statement  is returning an instance of gratitude instead of the values, this happened before in the pregnancy journaling app
    //NOW I KNOW, it wasn't being asked to return the properties of the objects, just the list of objects,
    //if we asked to print an instance, then we could get the actual values
    //print(' gratitude entry 1 ${_gratitudesList[0].entry1}'); // like so
    notifyListeners();
  }

  //FEAR
  final List<Fear> _fearsList = [
    Fear(
        define: 'dying',
        actions: 'not really much',
        stillAlright: 'Does it matter in the grand scheme of things?'),
    Fear(
        define: 'dying',
        actions: 'not really much',
        stillAlright: 'Does it matter in the grand scheme of things?'),
    Fear(
        define: 'dying',
        actions: 'not really much',
        stillAlright: 'Does it matter in the grand scheme of things?'),
    Fear(
        define: 'dying',
        actions: 'not really much',
        stillAlright: 'Does it matter in the grand scheme of things?'),
    Fear(
        define: 'dying',
        actions: 'not really much',
        stillAlright: 'Does it matter in the grand scheme of things?')
  ];
  UnmodifiableListView<Fear> get fearsList {
    return UnmodifiableListView(_fearsList);
  }

  int get fearsCount {
    return _fearsList.length;
  }

  void addAnotherFear(CalendarDay day, Fear fear) {
    DatabaseClient().upsertCalendarDayFearListAndFearTable(day, fear);
    // Fear newFear = Fear(
    //     //date: fear.date,
    //     define: fear.define,
    //     actions: fear.actions,
    //     stillAlright: fear.stillAlright);
    // _fearsList.add(newFear);
    // print(_fearsList);
    notifyListeners();
  }

  //GROUND

  bool meditationCompletedToday = false;
  void updateMeditationCompletedToday() {
    meditationCompletedToday = true;
    notifyListeners();
  }

  bool get meditationDoneToday {
    return meditationCompletedToday;
  }
}
