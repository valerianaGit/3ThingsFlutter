import 'package:flutter/material.dart';
import 'package:three_things_flutter/utilities/strings.dart';

class CalendarDayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Day'),
      ),
      body: Container(
          child: Column(
        children: [
          //Day circle with colors representing the 3 models
          Container(),
          ////Card fopr gratitudes
          mainCards('Gratitude', context, Strings.gratitudePage),

          ///card for fear
          mainCards('Fear', context, Strings.fearPage)
        ],
      )),
    );
  }
}

Widget mainCards(String title, BuildContext context, String routePage) {
  return Expanded(
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, routePage);
      },
      child: SizedBox(
        height: 60.0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            child: Center(child: Text(title)),
          ),
        ),
      ),
    ),
  );
}
