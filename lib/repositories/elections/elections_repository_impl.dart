import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/db/election_db.dart';
import 'package:political_preparedness_flutter/core/error/exception.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/network/network_info.dart';
import 'package:political_preparedness_flutter/datasources/local/local_datasource.dart';
import 'package:political_preparedness_flutter/datasources/remote/remote_datasource.dart';
import 'package:political_preparedness_flutter/repositories/elections/elections_repository.dart';

class ElectionsRepositoryImpl implements ElectionsRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ElectionsRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  // ignore: missing_return
  Future<void> deleteElection(Election election) {
    return localDataSource.deleteElection(DBElection(
        id: election.id,
        name: election.name,
        electionDay: election.electionDay,
        divisionId: election.divisionId,
        followed: election.followed));
  }

  @override
  Future<Either<Failure, String>> refreshNetworkElectionListAsync() async {
    if (await networkInfo.isConnected) {
      try {
        final networkElectionList =
            await remoteDataSource.getNetworkElectionList();

        if (networkElectionList != null && networkElectionList.isNotEmpty) {
          networkElectionList.forEach((networkElection) {
            localDataSource.insertElection(DBElection(
                id: networkElection.id,
                name: networkElection.name,
                electionDay: networkElection.electionDay,
                divisionId: networkElection.divisionId,
                followed: UNFOLLOWED));
          });
        }
        return Right(SERVER_SUCCESS_MESSAGE);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoNetworkFailure());
    }
  }

  @override
  Stream<List<Election>> get entireSavedElectionList {
    return localDataSource.getEntireSavedElectionList().map((dbElections) {
      final electionList = List<Election>();
      dbElections.forEach((dbElection) {
        electionList.add(Election(
            id: dbElection.id,
            name: dbElection.name,
            electionDay: dbElection.electionDay,
            divisionId: dbElection.divisionId,
            followed: dbElection.followed));
      });
      return electionList;
    });
  }

  @override
  Stream<List<Election>> get entireFollowedElectionList {
    return localDataSource.getEntireFollowedElectionList().map((dbElections) {
      final electionList = List<Election>();
      dbElections.forEach((dbElection) {
        electionList.add(Election(
            id: dbElection.id,
            name: dbElection.name,
            electionDay: dbElection.electionDay,
            divisionId: dbElection.divisionId,
            followed: dbElection.followed));
      });
      return electionList;
    });
  }
}
