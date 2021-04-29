import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';
import 'package:three_things_flutter/widgets/stored_values_cards.dart';

class FearList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CalendarDayViewModel>(
        builder: (context, entryData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final entry = entryData.fearsList[index];
              return StoredValuesCards(
                  content1: entry.define,
                  content2: entry.actions,
                  content3: entry.stillAlright);
            },
            itemCount: entryData.fearsCount,
          );
        },
      ),
    );
  }
}
