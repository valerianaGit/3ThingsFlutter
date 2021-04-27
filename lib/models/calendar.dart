import 'gratitude.dart';
import 'fear.dart';
import 'ground.dart';

class Calendar {
  List<Gratitude> gratitudeArray;
  List<Fear> fearArray;
  Ground ground;

  Calendar(
      {required this.gratitudeArray,
      required this.fearArray,
      required this.ground});
}
