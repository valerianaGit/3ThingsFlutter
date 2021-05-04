import 'gratitude.dart';
import 'fear.dart';

class CalendarDay {
  List<Gratitude> gratitudeArray;
  List<Fear> fearArray;
  bool groundBool;

  CalendarDay(
      {required this.gratitudeArray,
      required this.fearArray,
      this.groundBool = false});
}
