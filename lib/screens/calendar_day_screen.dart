import 'package:flutter/material.dart';
import 'package:three_things_flutter/utilities/strings.dart';
import 'package:three_things_flutter/widgets/main_cards.dart';
import 'package:three_things_flutter/utilities/constants.dart';

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
              SizedBox(
                height: 32.0,
              ),
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), //width of the border
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        width:
                            240.0, // this width forces the container to be a circle
                        height:
                            240.0, // this height forces the container to be a circle
                        child: Text(
                          "12", //TODO: - Update with day from data from calendar
                          style: TextStyle(
                            fontSize: 200.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        decoration: kInnerDecoration,
                      ),
                    ),
                  ),
                  decoration: kGradientBoxDecoration,
                ),
              ),
              SizedBox(
                height: 26.0, // 32 - 8 because cards have edgeinstes.all(8).
              ),
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
