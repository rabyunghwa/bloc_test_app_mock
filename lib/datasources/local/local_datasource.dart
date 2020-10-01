import 'package:political_preparedness_flutter/core/db/election_db.dart';

abstract class LocalDataSource {
  // elections
  Stream<List<DBElection>> getEntireSavedElectionList();
  Stream<List<DBElection>> getEntireFollowedElectionList();
  Future<void> insertElection(DBElection dbElection);
  Future<void> deleteElection(DBElection dbElection);
  // voter info
  Future<void> updateElection(DBElection dbElection);
  Stream<DBElection> getElectionById(int id);
}