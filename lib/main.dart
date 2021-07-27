import 'package:flutter/material.dart';
import 'screens/grounding_screen.dart';
import 'screens/home_daily_stoic_screen.dart';
import 'utilities/strings.dart';
import 'screens/gratitude_screen.dart';
import 'screens/fear_screen.dart';
import 'screens/calendar_screen.dart';
import 'screens/calendar_day_screen.dart';
import 'package:provider/provider.dart';
import 'package:three_things_flutter/models/viewModels/calendar_day_view_model.dart';
import 'screens/gratitude_or_fear_past_entries_screen.dart';
import 'services/moor_db.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      //ChangeNotifierProvider<CalendarDayViewModel>(
      create: (context) => CalendarDayDB(), //CalendarDayViewModel(),
      child: MaterialApp(
        title: '3 Things',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          Strings.homePage: (context) => HomeDailyStoic(),
          Strings.gratitudePage: (context) => GratitudeScreen(),
          Strings.fearPage: (context) => FearScreen(),
          Strings.groundingPage: (context) => GroundingScreen(),
          Strings.calendarPage: (context) => CalendarScreen(),
          Strings.calendarDayPage: (context) => CalendarDayPage(),
          Strings.gratitudePastEntriesPage: (context) =>
              GratitudeOrFearPastEntriesScreen(
                  generatingCard: Strings.routeToGratitudePastEntries),
          Strings.fearPastEntriesPage: (context) =>
              GratitudeOrFearPastEntriesScreen(
                  generatingCard: Strings.routeToFearPastEntries),
          //TODO: Possible refcator to include these screens as swappable widgets with the already
          //existing gratitude and fear screens , instead of creating the gratitude and past entries page,
          //could be handled the same way I handled the swap already.
          //TODO: - SWAP THE CURRENT Generating card values to be enums instead of strings, seems it might be much safer. -  TASK ID clickup #u95hq5
        },
      ),
    );
  }
}

/**
 * Flutter linter setup, to run => flutter analyze on terminal
 * Navigation -> named routes
 * 
 * state management -> Provider 
 * data persistence -> SQFlite / MOOR 
 * 
 * Packages and libraries 
 * https://pub.dev/packages/table_calendar
 */
