import 'package:flutter/material.dart';
import 'screens/grounding_screen.dart';
import 'screens/home_daily_stoic_screen.dart';
import 'utilities/strings.dart';
import 'screens/gratitude_screen.dart';
import 'screens/fear_screen.dart';

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
      //home: HomeDailyStoic() //OtpTimer(), //HomePage(),
      initialRoute: '/',
      routes: {
        Strings.homePage: (context) => HomeDailyStoic(),
        Strings.gratitudePage: (context) => GratitudeScreen(),
        Strings.fearPage: (context) => FearScreen(),
        Strings.groundingPage: (context) => GroundingScreen()
      },
    );
  }
}

/**
 * 
 * Navigation -> named routes
 * 
 * state management -> Provider 
 */
