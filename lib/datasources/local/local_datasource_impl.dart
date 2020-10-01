import 'package:meta/meta.dart';
import 'package:political_preparedness_flutter/core/db/election_db.dart';

import 'local_datasource.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final AppDatabase appDatabase;

  LocalDataSourceImpl({
    @required this.appDatabase
  });

  @override
  Future<void> deleteElection(DBElection dbElection) {
    return appDatabase.deleteElection(dbElection);
  }

  @override
  Stream<List<DBElection>> getEntireFollowedElectionList() {
    return appDatabase.getEntireFollowedElectionList();
  }

  @override
  Stream<List<DBElection>> getEntireSavedElectionList() {
    return appDatabase.getEntireSavedElectionList();
  }

  @override
  Future<void> insertElection(DBElection dbElection) {
    return appDatabase.insertElection(dbElection);
  }

  @override
  Stream<DBElection> getElectionById(int id) {
    return appDatabase.getElectionById(id.toString());
  }

  @override
  Future<void> updateElection(DBElection dbElection) {
    return appDatabase.updateElection(dbElection);
  }

}