import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:three_things_flutter/models/calendar_day.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/gratitude.dart';
import 'package:three_things_flutter/models/ground.dart';
import 'package:three_things_flutter/utilities/strings.dart';
import 'dart:convert';

class DatabaseClient {
  Future<Database> initializedDatabase() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'three_things_database.db'),
      onCreate: (database, version) async {
        // calendar day table
        await database.execute(
          "CREATE TABLE ${Strings.calendarDayDataBase} (id INTEGER PRIMARY KEY, date TEXT NOT NULL,gratitudes TEXT, fears TEXT, ground TEXT)",
        );
        // fear table
        await database.execute(
          "CREATE TABLE ${Strings.fearDataBase} (id INTEGER PRIMARY KEY, dateID INTEGER, define TEXT, actions TEXT, stillAlright TEXT)",
        );
        // gratitude table
        await database.execute(
          "CREATE TABLE ${Strings.gratitudeDataBase} (id INTEGER PRIMARY KEY, dateID INTEGER, entry1 TEXT, entry2 TEXT, entry3 TEXT)",
        );
        // ground table
        await database.execute(
          "CREATE TABLE ${Strings.groundDataBase} (id INTEGER PRIMARY KEY, dateID INTEGER)",
        );
      },
      version: 1,
    );
  }

// MARK: - CRUD OPERATIONS

// MARK: - Fear
// every change we make here, we have to also update the CalendarDay table
// Create / insert fear
  Future<void> insertFear(Fear fear) async {
    // Get a reference to the database.
    final Database database = await initializedDatabase();
    // Insert the fear into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same fear is inserted twice.
    // In this case, replace any previous data.
    await database.insert(
      Strings.fearDataBase,
      fear.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// Retrieve / get fear
// retrieve all the fears from table
  // A method that retrieves all the dogs from the dogs table.
  Future<List<Fear>> getAllFears() async {
    final Database database = await initializedDatabase();
    // Query the table for all The fears.
    final List<Map<String, dynamic>> maps =
        await database.query(Strings.fearDataBase);
    // Convert the List<Map<String, dynamic> into a List<Fear>.
    return List.generate(maps.length, (i) {
      return Fear(
          id: maps[i]["id"],
          define: maps[i]["define"],
          actions: maps[i]["actions"],
          stillAlright: maps[i]["stillAlright"],
          dateID: maps[i]["dateID"]); //DateTime.parse(maps[i]["date"]));
    });
  }

  // retrieve specific fear from list by their id (or even better by their date, we will need this for the calendar day)
  Future<Fear> fetchFear(int id) async {
    final Database database = await initializedDatabase();
    List<Map> results = await database.query(Strings.fearDataBase,
        columns: Fear.columns, where: "id = ?", whereArgs: [id]);
    Fear fear = Fear.fromMap(results[0]);
    return fear;
  }

  // Update fear
  Future<void> updateFear(Fear fear) async {
    // Get a reference to the database.
    final Database database = await initializedDatabase();
    // Update the given fear
    await database.update(
      Strings.fearDataBase,
      fear.toMap(),
      // Ensure that the fear has a matching id.
      where: 'id = ?',
      // Pass the fear's id as a whereArg to prevent SQL injection.
      whereArgs: [fear.id],
    );
  }

  // Delete fear
  ///DELETE DATA FROM SQLITE
  Future<void> deleteFear(int id) async {
    final Database database = await initializedDatabase();
    await database.delete(
      Strings.fearDataBase,
      where: "id = ?",
      whereArgs: [id],
    );
  }

//MARK: - Gratitude
// every change we make here, we have to also update the CalendarDay table

// Create / insert gratitude
  Future<void> insertGratitude(Gratitude gratitude) async {
    final Database database = await initializedDatabase();
    await database.insert(
      Strings.gratitudeDataBase,
      gratitude.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve / get gratitudes
  Future<List<Gratitude>> getAllGratitudes() async {
    final Database database = await initializedDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(Strings.gratitudeDataBase);
    return List.generate(maps.length, (i) {
      return Gratitude(
          id: maps[i]["id"],
          entry1: maps[i]["entry1"],
          entry2: maps[i]["entry2"],
          entry3: maps[i]["entry3"],
          dateID: maps[i]["dateID"]); //DateTime.parse(maps[i]["date"]));
    });
  }

  Future<Gratitude> fetchGratitude(int id) async {
    final Database database = await initializedDatabase();
    List<Map> results = await database.query(Strings.gratitudeDataBase,
        columns: Gratitude.columns, where: "id = ?", whereArgs: [id]);
    Gratitude gratitude = Gratitude.fromMap(results[0]);
    return gratitude;
  }

  // Update gratitude
  Future<void> updateGratitude(Gratitude gratitude) async {
    final Database database = await initializedDatabase();
    await database.update(
      Strings.gratitudeDataBase,
      gratitude.toMap(),
      where: 'id = ?',
      whereArgs: [gratitude.id],
    );
  }

  // Delete gratitude
  ///DELETE DATA FROM SQLITE
  Future<void> deleteGratitude(int id) async {
    final Database database = await initializedDatabase();
    await database.delete(
      Strings.gratitudeDataBase,
      where: "id = ?",
      whereArgs: [id],
    );
  }

//MARK: - Ground
// every change we make here, we have to also update the CalendarDay table
// Create / insert ground
  Future<void> insertGround(Ground ground) async {
    final Database database = await initializedDatabase();
    await database.insert(
      Strings.groundDataBase,
      ground.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve / get gratitudes
  Future<List<Ground>> getAllGrounds() async {
    final Database database = await initializedDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(Strings.groundDataBase);
    return List.generate(maps.length, (i) {
      return Ground(
          id: maps[i]["id"],
          dateID: maps[i]["dateID"] //DateTime.parse(maps[i]["date"]),
          );
    });
  }

// fetch single ground
  Future<Ground> fetchGround(int id) async {
    final Database database = await initializedDatabase();
    List<Map> results = await database.query(Strings.groundDataBase,
        columns: Ground.columns, where: "id = ?", whereArgs: [id]);
    Ground ground = Ground.fromMap(results[0]);
    return ground;
  }

  // Update ground
  Future<void> updateGround(Ground ground) async {
    final Database database = await initializedDatabase();
    await database.update(
      Strings.groundDataBase,
      ground.toMap(),
      where: 'id = ?',
      whereArgs: [ground.id],
    );
  }

  // Delete ground
  Future<void> deleteGround(int id) async {
    final Database database = await initializedDatabase();
    await database.delete(
      Strings.groundDataBase,
      where: "id = ?",
      whereArgs: [id],
    );
  }

//MARK: -  CalendarDay

// Create / insert calendarDay
  Future<void> insertCalendarDay(CalendarDay day) async {
    final Database database = await initializedDatabase();
    await database.insert(
      Strings.calendarDayDataBase,
      day.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Create / insert calendar day that returns that new calendarDay
  Future<CalendarDay> insertAndReturnCalendarDay(CalendarDay day) async {
    final Database database = await initializedDatabase();
    day.id = await database.insert(
      Strings.calendarDayDataBase,
      day.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return day;
  }

  // Retrieve / get calendarDay
  Future<List<CalendarDay>> getAllCalendarDays() async {
    final Database database = await initializedDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(Strings.calendarDayDataBase);
    return List.generate(maps.length, (i) {
      return CalendarDay(
          id: maps[i]['id'],
          date: DateTime.parse(maps[i]['date']),
          gratitudeArray: jsonDecode(maps[i]
              ['gratitude_array']), //Deserialize JSON strings into arrays
          fearArray: jsonDecode(
              maps[i]['fear_array']), //Deserialize JSON strings into arrays
          groundBool: maps[i]['ground_bool']);
    });
  }

// fetch single day
  Future<CalendarDay> fetchCalendarDay(int id) async {
    final Database database = await initializedDatabase();
    List<Map> results = await database.query(Strings.calendarDayDataBase,
        columns: CalendarDay.columns, where: "id = ?", whereArgs: [id]);
    CalendarDay day = CalendarDay.fromMap(results[0]);
    return day;
  }

  // Update day
  Future<void> updateday(CalendarDay day) async {
    final Database database = await initializedDatabase();
    await database.update(
      Strings.calendarDayDataBase,
      day.toMap(),
      where: 'id = ?',
      whereArgs: [day.id],
    );
  }

  // update calendar day's fear array and create or update a fear in the fear data table
  // when using this method, I will probably just pass the date for the calendarDay ,
  // based on the date , I will look if the date exists already in the database
  // use this method when we want to create a new fear
  Future<void> upsertCalendarDayFearListAndFearTable(
      CalendarDay day, Fear fear) async {
    final Database database = await initializedDatabase();
// here we are querying the database for how many entries exist with this date,
// and setting that as the count,
    var count = Sqflite.firstIntValue(await database.rawQuery(
        "SELECT COUNT(*) FROM ${Strings.calendarDayDataBase} WHERE date = ?",
        [day.date]));
    // if count == 0, there is no record of this in the database
// go ahead and create the date
    if (count == 0) {
// create because today's date was not existent already in the database
      var newDay = await insertAndReturnCalendarDay(day);
      upsertCalendarDayFearListAndFearTable(newDay, fear);
    } else {
      await database.update(
        // UPDATE ONLY THE day's fear list
        Strings.calendarDayDataBase,
        day.toMap(),
        where: 'id = ?',
        //TODO: - should this use a different key than the id, we nee to update the correct id,
        // if a new calendar day had to be created
        whereArgs: [day.fearArray], // update the fear array
      );
    }
    // create fear in fear table
    insertFear(fear);
  }

  // Update calendar day's gratirude array and create (or update) gratitude in the gratitude data table
  Future<void> upsertDayGratitudeListAndGratitudeTable(
      CalendarDay day, Gratitude gratitude) async {
    final Database database = await initializedDatabase();
    var count = Sqflite.firstIntValue(await database.rawQuery(
        "SELECT COUNT(*) FROM ${Strings.calendarDayDataBase} WHERE date = ?",
        [day.date]));
    if (count == 0) {
      // create because today's date was not existent already in the database
      var newDay = await insertAndReturnCalendarDay(day);
      upsertDayGratitudeListAndGratitudeTable(newDay, gratitude);
    } else {
      await database.update(
        //UPDATE ONLY THE day's gratitude list
        Strings.calendarDayDataBase,
        day.toMap(),
        where: 'id = ?',
        whereArgs: [day.gratitudeArray],
      );
    }
    // create gratitude in gratitude table
    insertGratitude(gratitude);
  }

  // Update calendar day's ground
  Future<void> upsertDayGroundingMeditation(
      CalendarDay day, Ground ground) async {
    final Database database = await initializedDatabase();
    var count = Sqflite.firstIntValue(await database.rawQuery(
        "SELECT COUNT(*) FROM ${Strings.calendarDayDataBase} WHERE date = ?",
        [day.date]));
    if (count == 0) {
      // create because today's date was not existent already in the database
      var newDay = await insertAndReturnCalendarDay(day);
      upsertDayGroundingMeditation(newDay, ground);
    } else {
      await database.update(
        // UPDATE ONLY THE day's ground propety to true
        Strings.calendarDayDataBase,
        day.toMap(),
        where: 'id = ?',
        whereArgs: [day.groundBool], // change from default false, to true
      );
    }
  }

  // Delete day
  // we might not need to do this, since we want all days to exist,
  // though eliminating all data in a day, yet not the day itself, might be useful
  // for that we would need to call update, not delete
  //TODO: CHECK OUT STEEMIT TUTORIAL FOR AN EXAMPLE OF HANDLING A NESTED DATA MODEL
  Future<void> deleteDay(int id) async {
    final Database database = await initializedDatabase();
    await database.delete(
      Strings.calendarDayDataBase,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
