import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/db/election_db.dart';
import 'package:political_preparedness_flutter/core/error/exception.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/model/address.dart';
import 'package:political_preparedness_flutter/core/model/administration_body.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/model/election_official.dart';
import 'package:political_preparedness_flutter/core/model/voter_info.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_address.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_administration_body.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election_official.dart';
import 'package:political_preparedness_flutter/core/network/network_info.dart';
import 'package:political_preparedness_flutter/datasources/local/local_datasource.dart';
import 'package:political_preparedness_flutter/datasources/remote/remote_datasource.dart';
import 'package:political_preparedness_flutter/repositories/voterinfo/voter_info_repository.dart';

// Note how "as" avoids conflict. We rename the file name to something else and then use "NewFileName.class" to refer to the actual class (USState.State).
import 'package:political_preparedness_flutter/core/model/state.dart'
    as USState;

class VoterInfoRepositoryImpl implements VoterInfoRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  VoterInfoRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Stream<Election> getElectionById(int id) {
    return localDataSource.getElectionById(id).map((dbElection) => Election(
        id: dbElection.id,
        name: dbElection.name,
        electionDay: dbElection.electionDay,
        divisionId: dbElection.divisionId,
        followed: dbElection.followed));
  }

  @override
  Future<Either<Failure, VoterInfo>> getVoterInfoAsync(String address,
      int electionId, bool officialOnly, bool allAvailable) async {
    if (await networkInfo.isConnected) {
      try {
        final networkVoterInfo = await remoteDataSource.getVoterInfoAsync(
            address, electionId, officialOnly, allAvailable);
        if (networkVoterInfo != null) {
          final networkElection = networkVoterInfo.election;
          final election = Election(
              id: networkElection.id,
              name: networkElection.name,
              electionDay: networkElection.electionDay,
              divisionId: networkElection.divisionId,
              followed: UNFOLLOWED);
          final networkStates = networkVoterInfo.states;
          var states = List<USState.State>();
          var electionOfficials = List<ElectionOfficial>();
          var networkElectionOfficials = List<NetworkElectionOfficial>();
          networkStates.forEach((networkState) {
            NetworkAdministrationBody networkAdminBody =
                networkState.administrationBody;
            NetworkAddress networkAddress =
                networkAdminBody.correspondenceAddress;
            networkElectionOfficials = networkAdminBody.electionOfficials;
            networkElectionOfficials.forEach((networkElectionOfficial) {
              electionOfficials.add(ElectionOfficial(
                  name: networkElectionOfficial.name,
                  title: networkElectionOfficial.title,
                  phone: networkElectionOfficial.phone,
                  fax: networkElectionOfficial.fax,
                  emailAddress: networkElectionOfficial.emailAddress));
            });
            states.add(USState.State(
                name: networkState.name,
                administrationBody: AdministrationBody(
                    name: networkAdminBody.name,
                    electionInfoUrl: networkAdminBody.electionInfoUrl,
                    votingLocationFinderUrl:
                        networkAdminBody.votingLocationFinderUrl,
                    ballotInfoUrl: networkAdminBody.ballotInfoUrl,
                    correspondenceAddress: Address(
                        line1: networkAddress.line1,
                        line2: networkAddress.line2,
                        city: networkAddress.city,
                        state: networkAddress.state,
                        zip: networkAddress.zip),
                    electionOfficials: electionOfficials)));
          });
          final voterInfo = VoterInfo(election: election, states: states);
          return Right(voterInfo);
        } else {
          return Right(VoterInfo()); // empty result
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoNetworkFailure());
    }
  }

  @override
  Future<void> updateElection(DBElection dbElection) {
    return localDataSource.updateElection(dbElection);
  }
}
