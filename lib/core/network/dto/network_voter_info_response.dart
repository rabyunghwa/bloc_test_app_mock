import 'package:political_preparedness_flutter/core/model/voter_info.dart';

import 'network_election.dart';
import 'network_state.dart';

/*
<- [network.dto.network_voter_info_test]

22.5. Add Network DTO (NetworkVoterInfoResponse)

https://bezkoder.com/dart-flutter-parse-json-string-array-to-object-list/

-> [repositories.voterinfo.voter_info_repository_impl]
 */
// @JsonSerializable(nullable: true)
class NetworkVoterInfoResponse extends VoterInfo {
  final NetworkElection election;
  final String pollingLocations; //TODO: Future Use
  final String contests; //TODO: Future Use
  final List<NetworkState> states;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkVoterInfoResponse(
      {this.election, this.pollingLocations, this.contests, this.states});

  // ignore: missing_return
  factory NetworkVoterInfoResponse.fromJson(dynamic json) {
    if (json != null) {
      // election
      var _networkElection = NetworkElection.fromJson(json['election']);
      // states
      var statesJson = json['state'] as List;
      var _states;
      if (statesJson != null && statesJson.length > 0) {
        _states = statesJson.map((stateJson) => NetworkState.fromJson(stateJson)).toList();
      } else {
        _states = List<NetworkState>(); // defaults to empty list
      }
      return NetworkVoterInfoResponse(
          election: _networkElection,
          states: _states
      );
    } else {
      return NetworkVoterInfoResponse(); // defaults to empty object
    }
  }

  @override
  List<Object> get props => [election, pollingLocations, contests, states];
}
