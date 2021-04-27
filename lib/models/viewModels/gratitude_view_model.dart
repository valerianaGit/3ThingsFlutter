import 'package:flutter/cupertino.dart';
import 'dart:collection';

import 'package:three_things_flutter/models/gratitude.dart';

class GratitudeViewModel extends ChangeNotifier {
  final List<Gratitude> _gratitudeList = [
    Gratitude(
        date: DateTime.now(), entry1: 'family', entry2: 'baloo', entry3: 'home')
  ];
  UnmodifiableListView<Gratitude> get gratitudeList {
    return UnmodifiableListView(_gratitudeList);
  }

  int get gratitudesCount {
    return _gratitudeList.length;
  }

  void addAnotherGratitude(Gratitude gratitude) {
    Gratitude newGratitude = Gratitude(
        date: gratitude.date,
        entry1: gratitude.entry1,
        entry2: gratitude.entry2,
        entry3: gratitude.entry3);
    _gratitudeList.add(newGratitude);
    print(_gratitudeList);
    notifyListeners();
  }
}
