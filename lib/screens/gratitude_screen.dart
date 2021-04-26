import 'package:flutter/material.dart';

class GratitudeScreen extends StatelessWidget {
  String newContent1;
  String newContent2;
  String newContent3;

  Widget getTextField(String newContent, String textPrompt) {
    return Container(
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
              labelText: textPrompt,
            ),
            onChanged: (newValue) {
              newContent = newValue;
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              getTextField(newContent1, 'Gratitude 1'),
              getTextField(newContent2, 'Gratitude 2'),
              getTextField(newContent3, 'Gratitude 3'),
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
