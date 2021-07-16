// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CalendarDayMoorData extends DataClass
    implements Insertable<CalendarDayMoorData> {
  final int id;
  final DateTime date;
  final List<Gratitude>? gratitudeArray;
  final List<Fear>? fearArray;
  final bool meditation;
  CalendarDayMoorData(
      {required this.id,
      required this.date,
      this.gratitudeArray,
      this.fearArray,
      required this.meditation});
  factory CalendarDayMoorData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CalendarDayMoorData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      gratitudeArray: $CalendarDayMoorTable.$converter0.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}gratitude_array'])),
      fearArray: $CalendarDayMoorTable.$converter1.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fear_array'])),
      meditation: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}meditation'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || gratitudeArray != null) {
      final converter = $CalendarDayMoorTable.$converter0;
      map['gratitude_array'] =
          Variable<String?>(converter.mapToSql(gratitudeArray));
    }
    if (!nullToAbsent || fearArray != null) {
      final converter = $CalendarDayMoorTable.$converter1;
      map['fear_array'] = Variable<String?>(converter.mapToSql(fearArray));
    }
    map['meditation'] = Variable<bool>(meditation);
    return map;
  }

  CalendarDayMoorCompanion toCompanion(bool nullToAbsent) {
    return CalendarDayMoorCompanion(
      id: Value(id),
      date: Value(date),
      gratitudeArray: gratitudeArray == null && nullToAbsent
          ? const Value.absent()
          : Value(gratitudeArray),
      fearArray: fearArray == null && nullToAbsent
          ? const Value.absent()
          : Value(fearArray),
      meditation: Value(meditation),
    );
  }

  factory CalendarDayMoorData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CalendarDayMoorData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      gratitudeArray:
          serializer.fromJson<List<Gratitude>?>(json['gratitudeArray']),
      fearArray: serializer.fromJson<List<Fear>?>(json['fearArray']),
      meditation: serializer.fromJson<bool>(json['meditation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'gratitudeArray': serializer.toJson<List<Gratitude>?>(gratitudeArray),
      'fearArray': serializer.toJson<List<Fear>?>(fearArray),
      'meditation': serializer.toJson<bool>(meditation),
    };
  }

  CalendarDayMoorData copyWith(
          {int? id,
          DateTime? date,
          List<Gratitude>? gratitudeArray,
          List<Fear>? fearArray,
          bool? meditation}) =>
      CalendarDayMoorData(
        id: id ?? this.id,
        date: date ?? this.date,
        gratitudeArray: gratitudeArray ?? this.gratitudeArray,
        fearArray: fearArray ?? this.fearArray,
        meditation: meditation ?? this.meditation,
      );
  @override
  String toString() {
    return (StringBuffer('CalendarDayMoorData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('gratitudeArray: $gratitudeArray, ')
          ..write('fearArray: $fearArray, ')
          ..write('meditation: $meditation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          date.hashCode,
          $mrjc(gratitudeArray.hashCode,
              $mrjc(fearArray.hashCode, meditation.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarDayMoorData &&
          other.id == this.id &&
          other.date == this.date &&
          other.gratitudeArray == this.gratitudeArray &&
          other.fearArray == this.fearArray &&
          other.meditation == this.meditation);
}

class CalendarDayMoorCompanion extends UpdateCompanion<CalendarDayMoorData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<List<Gratitude>?> gratitudeArray;
  final Value<List<Fear>?> fearArray;
  final Value<bool> meditation;
  const CalendarDayMoorCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.gratitudeArray = const Value.absent(),
    this.fearArray = const Value.absent(),
    this.meditation = const Value.absent(),
  });
  CalendarDayMoorCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.gratitudeArray = const Value.absent(),
    this.fearArray = const Value.absent(),
    this.meditation = const Value.absent(),
  }) : date = Value(date);
  static Insertable<CalendarDayMoorData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<List<Gratitude>?>? gratitudeArray,
    Expression<List<Fear>?>? fearArray,
    Expression<bool>? meditation,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (gratitudeArray != null) 'gratitude_array': gratitudeArray,
      if (fearArray != null) 'fear_array': fearArray,
      if (meditation != null) 'meditation': meditation,
    });
  }

  CalendarDayMoorCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? date,
      Value<List<Gratitude>?>? gratitudeArray,
      Value<List<Fear>?>? fearArray,
      Value<bool>? meditation}) {
    return CalendarDayMoorCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      gratitudeArray: gratitudeArray ?? this.gratitudeArray,
      fearArray: fearArray ?? this.fearArray,
      meditation: meditation ?? this.meditation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (gratitudeArray.present) {
      final converter = $CalendarDayMoorTable.$converter0;
      map['gratitude_array'] =
          Variable<String?>(converter.mapToSql(gratitudeArray.value));
    }
    if (fearArray.present) {
      final converter = $CalendarDayMoorTable.$converter1;
      map['fear_array'] =
          Variable<String?>(converter.mapToSql(fearArray.value));
    }
    if (meditation.present) {
      map['meditation'] = Variable<bool>(meditation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarDayMoorCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('gratitudeArray: $gratitudeArray, ')
          ..write('fearArray: $fearArray, ')
          ..write('meditation: $meditation')
          ..write(')'))
        .toString();
  }
}

class $CalendarDayMoorTable extends CalendarDayMoor
    with TableInfo<$CalendarDayMoorTable, CalendarDayMoorData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CalendarDayMoorTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _gratitudeArrayMeta =
      const VerificationMeta('gratitudeArray');
  late final GeneratedColumnWithTypeConverter<List<Gratitude>, String?>
      gratitudeArray = GeneratedColumn<String?>(
              'gratitude_array', aliasedName, true,
              typeName: 'TEXT', requiredDuringInsert: false)
          .withConverter<List<Gratitude>>($CalendarDayMoorTable.$converter0);
  final VerificationMeta _fearArrayMeta = const VerificationMeta('fearArray');
  late final GeneratedColumnWithTypeConverter<List<Fear>, String?> fearArray =
      GeneratedColumn<String?>('fear_array', aliasedName, true,
              typeName: 'TEXT', requiredDuringInsert: false)
          .withConverter<List<Fear>>($CalendarDayMoorTable.$converter1);
  final VerificationMeta _meditationMeta = const VerificationMeta('meditation');
  late final GeneratedColumn<bool?> meditation = GeneratedColumn<bool?>(
      'meditation', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (meditation IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, date, gratitudeArray, fearArray, meditation];
  @override
  String get aliasedName => _alias ?? 'calendar_day_moor';
  @override
  String get actualTableName => 'calendar_day_moor';
  @override
  VerificationContext validateIntegrity(
      Insertable<CalendarDayMoorData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    context.handle(_gratitudeArrayMeta, const VerificationResult.success());
    context.handle(_fearArrayMeta, const VerificationResult.success());
    if (data.containsKey('meditation')) {
      context.handle(
          _meditationMeta,
          meditation.isAcceptableOrUnknown(
              data['meditation']!, _meditationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarDayMoorData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CalendarDayMoorData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CalendarDayMoorTable createAlias(String alias) {
    return $CalendarDayMoorTable(_db, alias);
  }

  static TypeConverter<List<Gratitude>, String> $converter0 =
      const GratitudeListColumnConverter();
  static TypeConverter<List<Fear>, String> $converter1 =
      const FearListColumnConverter();
}

abstract class _$CalendarDayDB extends GeneratedDatabase {
  _$CalendarDayDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CalendarDayMoorTable calendarDayMoor =
      $CalendarDayMoorTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [calendarDayMoor];
}
