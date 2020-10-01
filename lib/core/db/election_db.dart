import 'package:moor_flutter/moor_flutter.dart';
import 'package:political_preparedness_flutter/core/constants.dart';

part 'election_db.g.dart';

class DBElections extends Table {
  TextColumn get id => text().named('id').customConstraint('UNIQUE')();
  TextColumn get name => text().named('name')();
  TextColumn get electionDay => text().named('electionDay')();
  TextColumn get divisionId => text().named('divisionId')();
  IntColumn get followed => integer().named('followed')();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [DBElections])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  // Daos
  // elections
  Stream<List<DBElection>> getEntireSavedElectionList() => select(dBElections).watch();
  Stream<List<DBElection>> getEntireFollowedElectionList() => (select(dBElections)..where((election) => election.followed.equals(FOLLOWED))).watch();
  Future insertElection(DBElection election) => into(dBElections).insert(election);
  Future deleteElection(DBElection election) => (delete(dBElections)..where((e) => e.id.equals(election.id))).go();

  // voter info
  Stream<DBElection> getElectionById(String id) => (select(dBElections)..where((election) => election.id.equals(id))).watchSingle();
  Future updateElection(DBElection election) => update(dBElections).replace(election);

}

