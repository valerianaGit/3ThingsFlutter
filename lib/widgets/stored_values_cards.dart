import 'package:flutter/material.dart';

class StoredValuesCards extends StatelessWidget {
  final String content1 = '';
  final String content2 = '';
  final String content3 = '';
  StoredValuesCards({content1, content2, content3});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Text('$content1, $content2, $content3'),
      ),
    );
  }
}
