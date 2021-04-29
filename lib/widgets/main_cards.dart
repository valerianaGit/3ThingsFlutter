import 'package:flutter/material.dart';

//TODO: - firgure out if there is a way to MAKE a stateless widget work?
// ignore: must_be_immutable
class MainCard extends StatelessWidget {
  late BuildContext context;
  final String routePage;
  final String title;
  MainCard(
      {required this.title, required this.context, required this.routePage});
  @override
  Widget build(BuildContext context) {
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
              elevation: 5.0,
              child: Center(child: Text(title)),
            ),
          ),
        ),
      ),
    );
  }
}
