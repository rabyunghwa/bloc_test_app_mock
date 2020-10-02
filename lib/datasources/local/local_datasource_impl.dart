import 'package:political_preparedness_flutter/core/db/db_election.dart';
import 'package:political_preparedness_flutter/fixtures/elections/election_list.dart';
import 'package:political_preparedness_flutter/fixtures/voter_info/voter_info.dart';

import 'local_datasource.dart';

class LocalDataSourceImpl implements LocalDataSource {

  LocalDataSourceImpl();

  @override
  Future<void> deleteElection(DBElection dbElection) {
    print("local data source impl deleting election...");
    return null;
  }

  @override
  Stream<List<DBElection>> getEntireFollowedElectionList() async* {
    yield getMockEmptyDBElectionList();
  }

  @override
  Stream<List<DBElection>> getEntireSavedElectionList() async* {
    yield getMockDBElectionList();
  }

  @override
  Future<void> insertElection(DBElection dbElection) {
    print("local data source impl inserting election...");
    return null;
  }

  @override
  Stream<DBElection> getElectionById(int id) async* {
    yield dBElection;
  }

  @override
  Future<void> updateElection(DBElection dbElection) {
    print("local data source impl updating election...");
    return null;
  }

}