import 'package:flutter/material.dart';
import 'package:three_things_flutter/utilities/strings.dart';
import 'package:three_things_flutter/widgets/main_cards.dart';

class HomeDailyStoic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - The Daily Stoic'),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainCard(
              title: 'Gratitude',
              context: context,
              routePage: Strings.gratitudePage),
          // mainCards('Gratitude', context, Strings.gratitudePage),
          MainCard(
              title: 'Fear', context: context, routePage: Strings.fearPage),
          // mainCards('Fear', context, Strings.fearPage),
          MainCard(
              title: 'Grounding',
              context: context,
              routePage: Strings.groundingPage),

          //mainCards('Grounding', context, Strings.groundingPage),
          MainCard(
              title: 'Calendar',
              context: context,
              routePage: Strings.calendarDayPage)
          //mainCards('Calendar', context, Strings.calendarDayPage)
        ],
      )),
    );
  }
}
