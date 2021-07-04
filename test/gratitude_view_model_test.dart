import 'package:test/test.dart';
import 'package:three_things_flutter/models/viewModels/gratitude_view_model.dart';
import 'package:three_things_flutter/models/gratitude.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';
import 'package:three_things_flutter/models/calendar_day.dart';

void main() {
  test('Number of gratitudes should be incremented to 1', () {
    final gratitudeViewModel = GratitudeViewModel();
    final calendarDayViewModel = CalendarDayViewModel();
    final gratitude = Gratitude(
        // date: DateTime.now(),
        entry1: "air",
        entry2: "water",
        entry3: "soil");

    //gratitudeViewModel.addAnotherGratitude(gratitude);
    calendarDayViewModel.addAnotherGratitude(CalendarDay(date: DateTime.now()),
        gratitude); //addAnotherFear(CalendarDay(date: DateTime.now()), fear);
// test could fail if I have some hard coded values in the gratitudes list in the view model, check there
    expect(gratitudeViewModel.gratitudesCount, 1);
  });
}
