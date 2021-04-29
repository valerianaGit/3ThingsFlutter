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
              //Day circle with colors representing the 3 models
              Container(),

              mainCards('Gratitude', context, Strings.gratitudePastEntriesPage),

              mainCards('Fear', context, Strings.fearPastEntriesPage)
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
