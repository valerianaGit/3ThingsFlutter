import 'package:flutter/material.dart';
import 'package:three_things_flutter/widgets/gratitude_list.dart';
import 'package:three_things_flutter/widgets/fear_list.dart';
import 'package:three_things_flutter/utilities/strings.dart';

class GratitudeOrFearPastEntriesScreen extends StatelessWidget {
  /// first, I had generatingard = '' for non null safety, and di not have the required parameter in the constructor -> it was not working
  /// generatingCard never got updated and it always remaind = ''.
  /// Once I made the constructor parameter required, marked it with 'this' and took out the '' initializer, it works now. generatingCard updates to correct
  /// value passed from calendar_day_screen -> to main -> back to here.

  final String generatingCard;
  GratitudeOrFearPastEntriesScreen({required this.generatingCard});
  Widget getWidget() {
    print('generating card: $generatingCard');
    if (generatingCard == Strings.routeToGratitudePastEntries) {
      return SafeArea(
        child: GratitudeList(),
      );
    } else {
      return SafeArea(
        child: FearList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Past entries'), //TODO: - REPLACE this with the data of the date we are looking into
      ),
      body: Container(
        child: getWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Done',
        child: const Icon(Icons.check),
      ),
    );
  }
}
