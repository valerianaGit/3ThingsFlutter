import 'package:moor_flutter/moor_flutter.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart' as j;
import 'package:moor/moor.dart';
import 'package:three_things_flutter/models/fear.dart';
import 'package:three_things_flutter/models/gratitude.dart';
// import 'package:three_things_flutter/models/gratitude.dart';
// import 'package:three_things_flutter/models/fear.dart';
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
}
