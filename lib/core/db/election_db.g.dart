// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'election_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DBElection extends DataClass implements Insertable<DBElection> {
  final String id;
  final String name;
  final String electionDay;
  final String divisionId;
  final int followed;
  DBElection(
      {@required this.id,
      @required this.name,
      @required this.electionDay,
      @required this.divisionId,
      @required this.followed});
  factory DBElection.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return DBElection(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      electionDay: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}electionDay']),
      divisionId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}divisionId']),
      followed:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}followed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || electionDay != null) {
      map['electionDay'] = Variable<String>(electionDay);
    }
    if (!nullToAbsent || divisionId != null) {
      map['divisionId'] = Variable<String>(divisionId);
    }
    if (!nullToAbsent || followed != null) {
      map['followed'] = Variable<int>(followed);
    }
    return map;
  }

  DBElectionsCompanion toCompanion(bool nullToAbsent) {
    return DBElectionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      electionDay: electionDay == null && nullToAbsent
          ? const Value.absent()
          : Value(electionDay),
      divisionId: divisionId == null && nullToAbsent
          ? const Value.absent()
          : Value(divisionId),
      followed: followed == null && nullToAbsent
          ? const Value.absent()
          : Value(followed),
    );
  }

  factory DBElection.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBElection(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      electionDay: serializer.fromJson<String>(json['electionDay']),
      divisionId: serializer.fromJson<String>(json['divisionId']),
      followed: serializer.fromJson<int>(json['followed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'electionDay': serializer.toJson<String>(electionDay),
      'divisionId': serializer.toJson<String>(divisionId),
      'followed': serializer.toJson<int>(followed),
    };
  }

  DBElection copyWith(
          {String id,
          String name,
          String electionDay,
          String divisionId,
          int followed}) =>
      DBElection(
        id: id ?? this.id,
        name: name ?? this.name,
        electionDay: electionDay ?? this.electionDay,
        divisionId: divisionId ?? this.divisionId,
        followed: followed ?? this.followed,
      );
  @override
  String toString() {
    return (StringBuffer('DBElection(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('electionDay: $electionDay, ')
          ..write('divisionId: $divisionId, ')
          ..write('followed: $followed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(electionDay.hashCode,
              $mrjc(divisionId.hashCode, followed.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DBElection &&
          other.id == this.id &&
          other.name == this.name &&
          other.electionDay == this.electionDay &&
          other.divisionId == this.divisionId &&
          other.followed == this.followed);
}

class DBElectionsCompanion extends UpdateCompanion<DBElection> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> electionDay;
  final Value<String> divisionId;
  final Value<int> followed;
  const DBElectionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.electionDay = const Value.absent(),
    this.divisionId = const Value.absent(),
    this.followed = const Value.absent(),
  });
  DBElectionsCompanion.insert({
    @required String id,
    @required String name,
    @required String electionDay,
    @required String divisionId,
    @required int followed,
  })  : id = Value(id),
        name = Value(name),
        electionDay = Value(electionDay),
        divisionId = Value(divisionId),
        followed = Value(followed);
  static Insertable<DBElection> custom({
    Expression<String> id,
    Expression<String> name,
    Expression<String> electionDay,
    Expression<String> divisionId,
    Expression<int> followed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (electionDay != null) 'electionDay': electionDay,
      if (divisionId != null) 'divisionId': divisionId,
      if (followed != null) 'followed': followed,
    });
  }

  DBElectionsCompanion copyWith(
      {Value<String> id,
      Value<String> name,
      Value<String> electionDay,
      Value<String> divisionId,
      Value<int> followed}) {
    return DBElectionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      electionDay: electionDay ?? this.electionDay,
      divisionId: divisionId ?? this.divisionId,
      followed: followed ?? this.followed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (electionDay.present) {
      map['electionDay'] = Variable<String>(electionDay.value);
    }
    if (divisionId.present) {
      map['divisionId'] = Variable<String>(divisionId.value);
    }
    if (followed.present) {
      map['followed'] = Variable<int>(followed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBElectionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('electionDay: $electionDay, ')
          ..write('divisionId: $divisionId, ')
          ..write('followed: $followed')
          ..write(')'))
        .toString();
  }
}

class $DBElectionsTable extends DBElections
    with TableInfo<$DBElectionsTable, DBElection> {
  final GeneratedDatabase _db;
  final String _alias;
  $DBElectionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _electionDayMeta =
      const VerificationMeta('electionDay');
  GeneratedTextColumn _electionDay;
  @override
  GeneratedTextColumn get electionDay =>
      _electionDay ??= _constructElectionDay();
  GeneratedTextColumn _constructElectionDay() {
    return GeneratedTextColumn(
      'electionDay',
      $tableName,
      false,
    );
  }

  final VerificationMeta _divisionIdMeta = const VerificationMeta('divisionId');
  GeneratedTextColumn _divisionId;
  @override
  GeneratedTextColumn get divisionId => _divisionId ??= _constructDivisionId();
  GeneratedTextColumn _constructDivisionId() {
    return GeneratedTextColumn(
      'divisionId',
      $tableName,
      false,
    );
  }

  final VerificationMeta _followedMeta = const VerificationMeta('followed');
  GeneratedIntColumn _followed;
  @override
  GeneratedIntColumn get followed => _followed ??= _constructFollowed();
  GeneratedIntColumn _constructFollowed() {
    return GeneratedIntColumn(
      'followed',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, electionDay, divisionId, followed];
  @override
  $DBElectionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'd_b_elections';
  @override
  final String actualTableName = 'd_b_elections';
  @override
  VerificationContext validateIntegrity(Insertable<DBElection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('electionDay')) {
      context.handle(
          _electionDayMeta,
          electionDay.isAcceptableOrUnknown(
              data['electionDay'], _electionDayMeta));
    } else if (isInserting) {
      context.missing(_electionDayMeta);
    }
    if (data.containsKey('divisionId')) {
      context.handle(
          _divisionIdMeta,
          divisionId.isAcceptableOrUnknown(
              data['divisionId'], _divisionIdMeta));
    } else if (isInserting) {
      context.missing(_divisionIdMeta);
    }
    if (data.containsKey('followed')) {
      context.handle(_followedMeta,
          followed.isAcceptableOrUnknown(data['followed'], _followedMeta));
    } else if (isInserting) {
      context.missing(_followedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBElection map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DBElection.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DBElectionsTable createAlias(String alias) {
    return $DBElectionsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DBElectionsTable _dBElections;
  $DBElectionsTable get dBElections => _dBElections ??= $DBElectionsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBElections];
}
