import 'package:political_preparedness_flutter/core/model/administration_body.dart';

import 'network_address.dart';
import 'network_election_official.dart';

class NetworkAdministrationBody extends AdministrationBody {
  final String name;
  final String electionInfoUrl;
  final String votingLocationFinderUrl;
  final String ballotInfoUrl;
  final NetworkAddress correspondenceAddress;
  final List<NetworkElectionOfficial> electionOfficials;
  
  NetworkAdministrationBody(
      {this.name,
      this.electionInfoUrl,
      this.votingLocationFinderUrl,
      this.ballotInfoUrl,
      this.correspondenceAddress,
      this.electionOfficials});

  factory NetworkAdministrationBody.fromJson(dynamic json) {
    if (json != null) {
      var adminName = json['name'] as String;
      var electionInfoUrl = json['electionInfoUrl'] as String;
      var votingLocationFinderUrl = json['votingLocationFinderUrl'] as String;
      var ballotInfoUrl = json['ballotInfoUrl'] as String;
      var correspondenceAddressJson = json['correspondenceAddress'];
      var correspondenceAddress =
          NetworkAddress.fromJson(correspondenceAddressJson);
      var electionOfficialsJson = json['electionOfficials'] as List;
      var electionOfficials;
      if (electionOfficialsJson != null && electionOfficialsJson.length > 0) {
        electionOfficials = electionOfficialsJson.map((electionOfficialJson) =>
            NetworkElectionOfficial.fromJson(electionOfficialJson)).toList();
      } else {
        electionOfficials = List<NetworkElectionOfficial>();
      }
      return NetworkAdministrationBody(
          name: adminName,
          electionInfoUrl: electionInfoUrl,
          votingLocationFinderUrl: votingLocationFinderUrl,
          ballotInfoUrl: ballotInfoUrl,
          correspondenceAddress: correspondenceAddress,
          electionOfficials: electionOfficials);
    } else {
      return NetworkAdministrationBody();
    }
  }

  @override
  List<Object> get props => [
        name,
        electionInfoUrl,
        votingLocationFinderUrl,
        ballotInfoUrl,
        correspondenceAddress,
        electionOfficials
      ];
}
