import 'package:political_preparedness_flutter/core/network/dto/network_election.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election_response.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_voter_info_response.dart';
import 'package:political_preparedness_flutter/datasources/remote/remote_datasource.dart';
import 'package:political_preparedness_flutter/fixtures/fixture_reader.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<List<NetworkElection>> getNetworkElectionList() async {
    var json = await loadAsset('assets/election_list.json');
    return NetworkElectionResponse.fromJson(json).elections;
  }

  @override
  Future<NetworkVoterInfoResponse> getVoterInfoAsync(String address,
      int electionId, bool officialOnly, bool allAvailable) async {
    var json = await loadAsset('assets/voter_info.json');
    return NetworkVoterInfoResponse.fromJson(json);
  }
}
