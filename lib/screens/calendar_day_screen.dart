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
              //TODO: - Create this circle with the colors in the border
              //Day circle with colors representing the 3 models
              //https://stackoverflow.com/a/59964891/7842175
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
                          "12",
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
              // ClipOval(
              //   clipBehavior: Clip.antiAlias,
              //   child: Container(

              //     decoration: BoxDecoration(

              //       border: Border(
              //         top: BorderSide(
              //             width: 40.0, color: Color(0xFFFFFFA500)), //orange
              //         left: BorderSide(
              //             width: 40.0, color: Color(0xFFFF6a0dad)), // purple
              //         right: BorderSide(
              //             width: 40.0, color: Color(0xFFFF00FF00)), //green
              //         bottom:
              //             BorderSide(width: 40.0, color: Color(0xFFFF000000)),
              //       ),
              //       //color: Colors.pink,
              //     ),
              //     //TODO: Use the day's number date to fill in this text

              //       child: Text(
              //         '12',
              //         style: TextStyle(fontSize: 200.0),
              //       ),

              //   ),
              // ),
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
