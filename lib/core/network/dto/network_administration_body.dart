import 'package:political_preparedness_flutter/core/model/administration_body.dart';

import 'network_address.dart';
import 'network_election_official.dart';

// @JsonSerializable(nullable: true)
class NetworkAdministrationBody extends AdministrationBody {
  final String name;
  final String electionInfoUrl;
  final String votingLocationFinderUrl;
  final String ballotInfoUrl;
  final NetworkAddress correspondenceAddress;
  final List<NetworkElectionOfficial> electionOfficials;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkAdministrationBody(
      {this.name,
      this.electionInfoUrl,
      this.votingLocationFinderUrl,
      this.ballotInfoUrl,
      this.correspondenceAddress,
      this.electionOfficials});

  factory NetworkAdministrationBody.fromJson(dynamic json) {
    if (json != null) {
      // admin name
      var _adminNameJson = json['name'] as String;
      var _adminName;
      if (_adminNameJson == null || _adminNameJson.isEmpty) {
        _adminName = ""; // defaults to empty string
      } else {
        _adminName = _adminNameJson;
      }
      // election info url
      var _electionInfoUrlJson = json['electionInfoUrl'] as String;
      var _electionInfoUrl;
      if (_electionInfoUrlJson == null || _electionInfoUrlJson.isEmpty) {
        _electionInfoUrl = ""; // defaults to empty string
      } else {
        _electionInfoUrl = _electionInfoUrlJson;
      }
      // voting location finder url
      var _votingLocationFinderUrlJson = json['votingLocationFinderUrl'] as String;
      var _votingLocationFinderUrl;
      if (_votingLocationFinderUrlJson == null || _votingLocationFinderUrlJson.isEmpty) {
        _votingLocationFinderUrl = ""; // defaults to empty string
      } else {
        _votingLocationFinderUrl = _votingLocationFinderUrlJson;
      }
      // ballot info url
      var _ballotInfoUrlJson = json['ballotInfoUrl'] as String;
      var _ballotInfoUrl;
      if (_ballotInfoUrlJson == null || _ballotInfoUrlJson.isEmpty) {
        _ballotInfoUrl = ""; // defaults to empty string
      } else {
        _ballotInfoUrl = _ballotInfoUrlJson;
      }
      // correspondence address
      var _correspondenceAddressJson = json['correspondenceAddress'];
      var _correspondenceAddress =
          NetworkAddress.fromJson(_correspondenceAddressJson);
      // election officials
      var _electionOfficialsJson = json['electionOfficials'] as List;
      var _electionOfficials;
      if (_electionOfficialsJson != null && _electionOfficialsJson.length > 0) {
        _electionOfficials = _electionOfficialsJson.map((electionOfficialJson) =>
            NetworkElectionOfficial.fromJson(electionOfficialJson)).toList();
      } else {
        _electionOfficials = List<NetworkElectionOfficial>(); // default to empty list
      }
      return NetworkAdministrationBody(
          name: _adminName,
          electionInfoUrl: _electionInfoUrl,
          votingLocationFinderUrl: _votingLocationFinderUrl,
          ballotInfoUrl: _ballotInfoUrl,
          correspondenceAddress: _correspondenceAddress,
          electionOfficials: _electionOfficials);
    } else {
      return NetworkAdministrationBody(); // defaults to empty object
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
