import 'package:test/test.dart';
import 'package:three_things_flutter/models/viewModels/gratitude_view_model.dart';
import 'package:three_things_flutter/models/gratitude.dart';

void main() {
  test('Number of gratitudes should be incremented to 1', () {
    final gratitudeViewModel = GratitudeViewModel();
    final gratitude = Gratitude(
        // date: DateTime.now(),
        entry1: "air",
        entry2: "water",
        entry3: "soil");

    gratitudeViewModel.addAnotherGratitude(gratitude);
// test could fail if I have some hard coded values in the gratitudes list in the view model, check there
    expect(gratitudeViewModel.gratitudesCount, 1);
  });
}
