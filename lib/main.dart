import 'package:flutter/material.dart';
import 'screens/grounding_screen.dart';
import 'screens/home_daily_stoic_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeDailyStoic() //OtpTimer(), //HomePage(),
        );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
