import 'package:flutter/material.dart';
import 'package:three_things_flutter/widgets/gratitude_list.dart';
import 'package:three_things_flutter/widgets/fear_list.dart';
import 'package:three_things_flutter/utilities/strings.dart';

class GratitudeOrFearPastEntriesScreen extends StatelessWidget {
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
