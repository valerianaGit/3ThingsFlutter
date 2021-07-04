import 'package:test/test.dart';
import 'package:three_things_flutter/models/viewModels/fear_view_model.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';
import 'package:three_things_flutter/models/calendar_day.dart';

void main() {
  test('Number of fears should be incremented to 1', () {
    final fearViewModel = FearViewModel();
    final calendarDayViewModel = CalendarDayViewModel();
    final fear = Fear(
        //date: DateTime.now(),
        define: 'Afraid of monsters',
        actions: 'get monster spray',
        stillAlright: 'If I get eaten, I will go live in wonderland');

    //fearViewModel.addAnotherFear(CalendarDay(date: DateTime.now()), fear);
    calendarDayViewModel.addAnotherFear(
        CalendarDay(date: DateTime.now()), fear);
// test could fail if I have some hard coded values in the fears list in the fear view model, check there
    expect(fearViewModel.fearsCount, 1);
  });
}
