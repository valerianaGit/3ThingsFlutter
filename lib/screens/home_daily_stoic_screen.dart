import 'package:flutter/material.dart';

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
          SizedBox(
            height: 60.0,
            child: Card(
              child: Center(child: Text('Gratitude')),
            ),
          ),
          SizedBox(
            height: 60.0,
            child: Card(
              child: Center(child: Text('Fear')),
            ),
          ),
          SizedBox(
            height: 60.0,
            child: Card(
              child: Center(child: Text('Grounding')),
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
