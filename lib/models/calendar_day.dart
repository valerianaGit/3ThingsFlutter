import 'gratitude.dart';
import 'fear.dart';
import 'ground.dart';

class CalendarDay {
  List<Gratitude> gratitudeArray;
  List<Fear> fearArray;
  Ground ground; // I think we just need a bool YES OR NO - no more info here ?

  CalendarDay(
      {required this.gratitudeArray,
      required this.fearArray,
      required this.ground});
}
