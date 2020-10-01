import 'package:political_preparedness_flutter/core/network/dto/network_election.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_voter_info_response.dart';

abstract class RemoteDataSource {
  // elections
  Future<List<NetworkElection>> getNetworkElectionList();
  // voter info
  Future<NetworkVoterInfoResponse> getVoterInfoAsync(String address, int electionId, bool officialOnly, bool allAvailable);
}