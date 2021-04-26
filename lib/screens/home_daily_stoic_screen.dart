import 'package:flutter/material.dart';
import 'package:three_things_flutter/utilities/strings.dart';
// import 'gratitude_screen.dart';
// import 'fear_screen.dart';
// import 'grounding_screen.dart';

class HomeDailyStoic extends StatelessWidget {
  const HomeDailyStoic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Home - The Daily Stoic'),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Strings.gratitudePage);
            },
            child: SizedBox(
              height: 60.0,
              child: Card(
                child: Center(child: Text('Gratitude')),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Strings.fearPage);
            },
            child: SizedBox(
              height: 60.0,
              child: Card(
                child: Center(child: Text('Fear')),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Strings.groundingPage);
            },
            child: SizedBox(
              height: 60.0,
              child: Card(
                child: Center(child: Text('Grounding')),
              ),
            ),
          ),

          // Card(
          //   child: Text('Fear'),
          // ),
          // Card(
          //   child: Text('Grounding'),
          // ),
        ],
      )),
    ));
  }
}
