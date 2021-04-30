import 'package:flutter/material.dart';

final kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
  borderRadius: BorderRadius.circular(32),
);
// border for all 3 colors
final kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
  border: Border.all(
    color: Colors.amber, //kHintColor, so this should be changed?
  ),
  borderRadius: BorderRadius.circular(32),
);
