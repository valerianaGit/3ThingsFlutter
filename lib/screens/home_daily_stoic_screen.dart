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
          mainCards('Gratitude', context, Strings.gratitudePage),
          mainCards('Fear', context, Strings.fearPage),
          mainCards('Grounding', context, Strings.groundingPage),
          mainCards('Calendar', context, Strings.calendarDayPage)
        ],
      )),
    );
  }
}
