import 'package:flutter/cupertino.dart';
import 'dart:collection';

import 'package:three_things_flutter/models/gratitude.dart';

class GratitudeViewModel extends ChangeNotifier {
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
}
