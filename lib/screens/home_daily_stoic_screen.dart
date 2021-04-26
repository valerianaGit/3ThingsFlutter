import 'package:flutter/material.dart';
import 'package:three_things_flutter/utilities/strings.dart';

class HomeDailyStoic extends StatelessWidget {
  const HomeDailyStoic({Key key}) : super(key: key);
//TODO: - ABSTRACT CARDS CODE
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
          // Expanded(
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, Strings.gratitudePage);
          //     },
          //     child: Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: Card(
          //         child: Center(child: Text('Gratitude')),
          //       ),
          //     ),
          //   ),
          // ),
          mainCards('Gratitude', context, Strings.gratitudePage),
          // Expanded(
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, Strings.fearPage);
          //     },
          //     child: SizedBox(
          //       height: 60.0,
          //       child: Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Card(
          //           child: Center(child: Text('Fear')),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          mainCards('Fear', context, Strings.fearPage),
          // Expanded(
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, Strings.groundingPage);
          //     },
          //     child: SizedBox(
          //       height: 60.0,
          //       child: Padding(
          //         padding: EdgeInsets.all(8.0),
          //         child: Card(
          //           child: Center(child: Text('Grounding')),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          mainCards('Grounding', context, Strings.groundingPage),
          mainCards('Calendar', context, Strings.groundingPage)
        ],
      )),
    );
  }
}
