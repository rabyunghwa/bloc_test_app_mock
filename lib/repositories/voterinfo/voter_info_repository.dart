import 'package:dartz/dartz.dart';
import 'package:political_preparedness_flutter/core/db/db_election.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/model/voter_info.dart';

abstract class VoterInfoRepository {
  // local
  Future<void> updateElection(DBElection dbElection);
  Stream<Election> getElectionById(int id);
  // remote
  Future<Either<Failure, VoterInfo>> getVoterInfoAsync(String address, int electionId, bool officialOnly, bool allAvailable);
}