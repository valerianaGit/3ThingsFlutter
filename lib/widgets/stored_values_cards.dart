import 'package:flutter/material.dart';

class StoredValuesCards extends StatelessWidget {
  final String content1;
  final String content2;
  final String content3;
  StoredValuesCards(
      {required this.content1, required this.content2, required this.content3});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('$content1,\n $content2,\n $content3'),
          ),
        ),
      ),
    );
  }
}
