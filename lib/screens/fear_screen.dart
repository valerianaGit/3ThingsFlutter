import 'package:flutter/material.dart';

class FearScreen extends StatelessWidget {
  String newContent1 = '';
  String newContent2 = '';
  String newContent3 = '';

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
              getTextField(newContent1, 'Define my fear'),
              getTextField(newContent2, 'What can I do about it?'),
              getTextField(newContent3,
                  'If this comes to pass, how will things still be ok?'),
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
