import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';
import 'package:three_things_flutter/widgets/stored_values_cards.dart';

class GratitudeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CalendarDayViewModel>(
        builder: (context, entryData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final entry = entryData.gratitudesList[index];

              return StoredValuesCards(
                  content1: 'On this day, I was thankful for\n ${entry.entry1}',
                  content2: entry.entry2,
                  content3: entry.entry3);
            },
            itemCount: entryData.gratitudesCount,
          );
        },
      ),
    );
  }
}
//TODO: - FIX that cards are rendering as tiny little things and you can't read anything
