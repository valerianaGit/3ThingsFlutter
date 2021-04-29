import 'package:flutter/material.dart';
import 'package:three_things_flutter/utilities/strings.dart';
import 'package:three_things_flutter/widgets/main_cards.dart';

class CalendarDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Day'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              //TODO: - Create this circle with the colors
              //Day circle with colors representing the 3 models
              Container(),
              MainCard(
                  title: 'Gratitude',
                  context: context,
                  routePage: Strings.gratitudePastEntriesPage),
              MainCard(
                  title: 'Fear',
                  context: context,
                  routePage: Strings.fearPastEntriesPage),
            ],
          ),
        ),
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
