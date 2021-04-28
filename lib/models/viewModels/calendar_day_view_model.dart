import 'package:flutter/cupertino.dart';
import 'gratitude_view_model.dart';
import 'fear_view_model.dart';
import 'ground_view_model.dart';
import 'package:three_things_flutter/models/gratitude.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/ground.dart';
import 'dart:collection';
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
    Gratitude(
        date: DateTime.now(), entry1: 'family', entry2: 'baloo', entry3: 'home')
  ];
  UnmodifiableListView<Gratitude> get gratitudesList {
    return UnmodifiableListView(_gratitudesList);
  }

  int get gratitudesCount {
    return _gratitudesList.length;
  }

  void addAnotherGratitude(Gratitude gratitude) {
    Gratitude newGratitude = Gratitude(
        date: gratitude.date,
        entry1: gratitude.entry1,
        entry2: gratitude.entry2,
        entry3: gratitude.entry3);
    _gratitudesList.add(newGratitude);
    print(_gratitudesList);
    notifyListeners();
  }

  //FEAR
  //
  final List<Fear> _fearsList = [
    Fear(
        date: DateTime.now(),
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

  void addAnotherFear(Fear fear) {
    Fear newFear = Fear(
        date: fear.date,
        define: fear.define,
        actions: fear.actions,
        stillAlright: fear.stillAlright);
    _fearsList.add(newFear);
    print(_fearsList);
    notifyListeners();
  }

  //GROUND
  //WE JUST NEED TO HAVE A BOLLEAN , THAT STARTS AT FALSE AND TURNS TO YES IF THERE WAS A COMPLETED MEDITATION THAT DAY

}
