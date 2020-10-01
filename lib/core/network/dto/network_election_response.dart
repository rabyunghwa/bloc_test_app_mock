import 'package:equatable/equatable.dart';

import 'network_election.dart';

class NetworkElectionResponse extends Equatable {
  final String kind;
  final List<NetworkElection> elections;

  NetworkElectionResponse({this.kind, this.elections});

  factory NetworkElectionResponse.fromJson(dynamic json) {
    if (json != null) {
      if (json['elections'] != null) {
        var electionsJson = json['elections'] as List;
        var _elections;
        if (electionsJson != null && electionsJson.length > 0) {
          _elections = electionsJson.map((electionJson) => NetworkElection.fromJson(electionJson)).toList();
        } else {
          _elections = List<NetworkElection>();
        }
        return NetworkElectionResponse(
            kind: json['kind'] as String,
            elections: _elections
        );
      } else {
        return NetworkElectionResponse(
            kind: json['kind'] as String
        );
      }
    } else {
      return NetworkElectionResponse();
    }

  }

  @override
  List<Object> get props => [kind, elections];

}
