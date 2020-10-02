import 'package:equatable/equatable.dart';

import 'network_election.dart';

/*
<- [network.dto.network_election]

5.2. Add Network DTO

One thing to note is that after calling List.map, have to append ".toList"

-> [repositories.elections.elections_repository_impl]
 */
// @JsonSerializable(nullable: true)
class NetworkElectionResponse extends Equatable {
  final String kind;
  final List<NetworkElection> elections;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkElectionResponse({this.kind, this.elections});

  factory NetworkElectionResponse.fromJson(dynamic json) {
    if (json != null) {
      if (json['elections'] != null) {
        // elections
        var electionsJson = json['elections'] as List;
        var _elections;
        if (electionsJson != null && electionsJson.length > 0) {
          _elections = electionsJson.map((electionJson) => NetworkElection.fromJson(electionJson)).toList();
        } else {
          _elections = List<NetworkElection>();
        }
        // kind
        var _kindJson = json['kind'] as String;
        var _kind;
        if (_kindJson == null || _kindJson.isEmpty) {
          _kind = "";
        } else {
          _kind = _kindJson;
        }
        return NetworkElectionResponse(
            kind: _kind,
            elections: _elections
        );
      } else {
        // kind
        var _kindJson = json['kind'] as String;
        var _kind;
        if (_kindJson == null || _kindJson.isEmpty) {
          _kind = "";
        } else {
          _kind = _kindJson;
        }
        return NetworkElectionResponse(
            kind: _kind
        );
      }
    } else {
      return NetworkElectionResponse(); // defaults to empty object
    }

  }

  @override
  List<Object> get props => [kind, elections];

}
