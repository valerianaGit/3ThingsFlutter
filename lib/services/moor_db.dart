import 'package:moor_flutter/moor_flutter.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/moor.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/gratitude.dart';
// import 'package:three_things_flutter/models/gratitude.dart';
// import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/calendar_day.dart';
import 'package:three_things_flutter/models/ground.dart';
import 'package:three_things_flutter/widgets/fear_list.dart';
import 'package:three_things_flutter/widgets/gratitude_list.dart';
part 'moor_db.g.dart';

/// create MOOR table
class CalendarDayMoor extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get gratitudeArray =>
      text().map(const GratitudeListColumnConverter()).nullable()();
  TextColumn get fearArray =>
      text().map(const FearListColumnConverter()).nullable()();
  BoolColumn get meditation => boolean().withDefault(const Constant(false))();
}

@UseMoor(tables: [CalendarDayMoor])
class CalendarDayDB extends _$CalendarDayDB {
  CalendarDayDB()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'three_things_moor.db'));
  @override
  int get schemaVersion => 1;

  Future<List<CalendarDayMoorData>> getCalendarDays() =>
      (select(calendarDayMoor)
            ..orderBy([
              (day) =>
                  OrderingTerm(expression: day.date, mode: OrderingMode.desc)
            ]))
          .get();
  Future<int> insertDay(CalendarDayMoorData day) => into(calendarDayMoor)
      .insert(day); // might try to have the full calendar ready to go

  Future<bool> updateDay(CalendarDayMoorData day) =>
      update(calendarDayMoor).replace(
          day); // may only ever seek to update the day with new information, this replaces, does not add information

  //⚠️ Caution: If you don't explicitly add a where clause on updates or deletes, the statement will affect all rows in the table!
  //https://moor.simonbinder.eu/docs/getting-started/writing_queries/#updates-and-deletes

  //TODO: FIX THIS ENTRY , BUT WE ARE ON THE RIGHT PATH i THINK, JUST NEED TO UPDATE THE gratitude array only.
  Future updateDayWithNewGratitude(Gratitude gratitude) =>
      (update(calendarDayMoor)..where((tbl) => tbl.gratitudeArray.isNotNull()))
          .write(CalendarDayMoorCompanion(
              gratitudeArray: Value([
        gratitude
      ]))); // Here i just need to add one fear to the fear list  //fromData(gratitude.toMap(), calendarDayMoor));

//TODO: COMPLETE THIS CRUD METHOD for updating a calendar day's fear array column and everything else remains the same
// pass in a fear
// update method => table - calendarDayMoor
// where(this looks for a boolean value), maybe something else?
// the fearArray column
// find the existing fear array column and add to the List
// (is there a way to access the List and do something like list.append?)
  Future updateDayWithNewFear(Fear fear) =>
      (update(calendarDayMoor)..where((tbl) => tbl.fearArray.isNotNull()))
          .write(CalendarDayMoorCompanion(
              fearArray: Value([
        fear
      ]))); // I think this will replace the column values with the new fear or create 2 dimensional array of values?

  // METHOD to update if a meditation was completed on that day
  Future updateDayWithMeditation(Ground meditation) => (update(calendarDayMoor)
        ..where((tbl) => tbl.meditation))
      .write(CalendarDayMoorCompanion(meditation: Value(meditation.meditate)));

  Future<int> deleteDay(CalendarDayMoorData day) =>
      delete(calendarDayMoor).delete(day); // may not need to delete any days
}
// where is the days list coming from?
// when creating the generated file, a getter is created with the name of the class, in our case it is calendarDayMoor
// where do i declare those properties?
// is this really how we write crud methods in moor? ->
// plan a => check video out again,
// plan b => check out Moor docs
// plan c => look online
// plan d => check out the youtube video explaining how to use MOOR.
