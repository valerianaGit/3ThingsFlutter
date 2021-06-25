import 'gratitude.dart';
import 'fear.dart';
import 'ground.dart';

class CalendarDay {
  int? id;
  DateTime date = DateTime.now(); // JUST STORE THE DATE, NOT TIME.
  List<Gratitude>?
      gratitudeArray; // for these lists, I'll need to serialize into JSON
  List<Fear>?
      fearArray; //discussion on serialization here https://stackoverflow.com/a/60506278/7842175
  bool? groundBool;

  CalendarDay({this.id, this.gratitudeArray, this.fearArray, this.groundBool});
}
