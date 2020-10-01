import 'package:political_preparedness_flutter/core/model/voter_info.dart';

import 'network_election.dart';
import 'network_state.dart';

class NetworkVoterInfoResponse extends VoterInfo {
  final NetworkElection election;
  final String pollingLocations;
  final String contests;
  final List<NetworkState> states;

  NetworkVoterInfoResponse(
      {this.election, this.pollingLocations, this.contests, this.states});

  // ignore: missing_return
  factory NetworkVoterInfoResponse.fromJson(dynamic json) {
    if (json != null) {
      var networkElection = NetworkElection.fromJson(json['election']);
      var statesJson = json['state'] as List;
      var _states;
      if (statesJson != null && statesJson.length > 0) {
        _states = statesJson.map((stateJson) => NetworkState.fromJson(stateJson)).toList();
      } else {
        _states = List<NetworkState>();
      }
      return NetworkVoterInfoResponse(
          election: networkElection,
          states: _states
      );
    } else {
      return NetworkVoterInfoResponse();
    }
  }

  @override
  List<Object> get props => [election, pollingLocations, contests, states];
}
