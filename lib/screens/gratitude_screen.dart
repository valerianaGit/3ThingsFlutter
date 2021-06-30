import 'package:flutter/material.dart';
import 'package:three_things_flutter/models/gratitude.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';
import 'package:provider/provider.dart';

class GratitudeScreen extends StatelessWidget {
  // GratitudeScreen(
  //     {required this.newContent1,
  //     required this.newContent2,
  //     required this.newContent3});
  //GratitudeScreen({});

  // Widget getTextField(String newContent, String textPrompt) {
  //   return Container(
  //     child: Expanded(
  //       child: Padding(
  //         padding: EdgeInsets.all(8.0),
  //         child: TextField(
  //           maxLines: 5, //wrap text
  //           autofocus: true,
  //           autocorrect: true,
  //           cursorColor: Colors.purple[900],
  //           decoration: InputDecoration(
  //             border: OutlineInputBorder(),
  //             labelText: textPrompt,
  //           ),
  //           onChanged: (newValue) {
  //             newContent = newValue;
  //             print('newContent : $newContent');
  //             // print('newContent1: $newContent1');
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    String newContent1 = '';
    String newContent2 = '';
    String newContent3 = '';
    // Widget getTextField(String newContent, String textPrompt) {
    //   return Container(
    //     child: Expanded(
    //       child: Padding(
    //         padding: EdgeInsets.all(8.0),
    //         child: TextField(
    //           maxLines: 5, //wrap text
    //           autofocus: true,
    //           autocorrect: true,
    //           cursorColor: Colors.purple[900],
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(),
    //             labelText: textPrompt,
    //           ),
    //           onChanged: (newValue) {
    //             newContent = newValue;
    //             // print('newContent : $newContent');
    //             // print('newContent1: $newContent1');
    //           },
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 32.0,
                    bottom: 32.0,
                  ),
                  child: Text('3 things I am grateful for today')),
              //TODO: - Abstract this code for the textfield cards into a mutable object?
              //this might work to be able to mutate the values in content1,2,3
              //reuse in the FEAR SCREEN as well since they are basically the same
              Container(
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5, //wrap text
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: Colors.purple[900],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gratitude 1',
                      ),
                      onChanged: (newValue) {
                        newContent1 = newValue;
                      },
                    ),
                  ),
                ),
              ),
              //end of textfield card
              Container(
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5, //wrap text
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: Colors.purple[900],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gratitude 2',
                      ),
                      onChanged: (newValue) {
                        newContent2 = newValue;
                      },
                    ),
                  ),
                ),
              ),
              Container(
                child: Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 5, //wrap text
                      autofocus: true,
                      autocorrect: true,
                      cursorColor: Colors.purple[900],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gratitude 3',
                      ),
                      onChanged: (newValue) {
                        newContent3 = newValue;
                      },
                    ),
                  ),
                ),
              ),
              // getTextField(newContent1, 'Gratitude 1'),
              // getTextField(newContent2, 'Gratitude 2'),
              // getTextField(newContent3, 'Gratitude 3'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CalendarDayViewModel>(context, listen: false)
              .addAnotherGratitude(
            Gratitude(
                //dateID: ,// HOW TO ACCESS THE DATEID ?DateTime.now(),
                entry1: newContent1,
                entry2: newContent2,
                entry3: newContent3),
          );

          Navigator.pop(context);
        },
        tooltip: 'Done',
        child: const Icon(Icons.check),
      ),
    );
  }
}
