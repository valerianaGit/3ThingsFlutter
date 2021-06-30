import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';

class FearScreen extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Fear'),
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
                child: Text('Define my fears'),
              ),
              // getTextField(newContent1, 'Define my fear'),
              // getTextField(newContent2, 'What can I do about it?'),
              // getTextField(newContent3,
              //     'If this comes to pass, how will things still be ok?'),
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
                        labelText: 'Define my fear',
                      ),
                      onChanged: (newValue) {
                        newContent1 = newValue;
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
                        labelText: 'What can I do about it?',
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
                        labelText:
                            'If this comes to pass, how will things still be ok?',
                      ),
                      onChanged: (newValue) {
                        newContent3 = newValue;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CalendarDayViewModel>(context, listen: false)
              .addAnotherFear(
            Fear(
                //dateID: ,//FIGURE OUT HOW TO ACCESS TODAY'S DAYID DateTime.now(),
                define: newContent1,
                actions: newContent2,
                stillAlright: newContent3),
          );
          Navigator.pop(context);
        },
        tooltip: 'Done',
        child: const Icon(Icons.check),
      ),
    );
  }
}
