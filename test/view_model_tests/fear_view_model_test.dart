import 'package:test/test.dart';
import 'package:three_things_flutter/models/viewModels/fear_view_model.dart';
import 'package:three_things_flutter/models/fear.dart';

void main() {
  test('Number of fears should be incremented to 1', () {
    final fearViewModel = FearViewModel();
    final fear = Fear(
        date: DateTime.now(),
        define: 'Afraid of monsters',
        actions: 'get monster spray',
        stillAlright: 'If I get eaten, I will go live in wonderland');

    fearViewModel.addAnotherFear(fear);
// test could fail if I have some hard coded values in the fears list in the fear view model, check there
    expect(fearViewModel.fearsCount, 1);
  });
}
