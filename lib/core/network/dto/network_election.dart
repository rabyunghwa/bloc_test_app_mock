import 'package:political_preparedness_flutter/core/model/election.dart';

/*
<- [network.dto.network_election_test]

5.1. Add Network DTO

-> [network.dto.network_election_response]
 */
// @JsonSerializable(nullable: true)
class NetworkElection extends Election {
  final String id;
  final String name;
  final String electionDay;
  final String divisionId;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkElection({this.id, this.name, this.electionDay, this.divisionId})
      : super(
      id: id,
      name: name,
      electionDay: electionDay,
      divisionId: divisionId
  );

  factory NetworkElection.fromJson(dynamic json) {
    if (json != null) {
      // id
      var _idJson = json['id'] as String;
      var _id;
      if (_idJson == null || _idJson.isEmpty) {
        _id = ""; // defaults to empty string
      } else {
        _id = _idJson;
      }
      // name
      var _nameJson = json['name'] as String;
      var _name;
      if (_nameJson == null || _nameJson.isEmpty) {
        _name = ""; // defaults to empty string
      } else {
        _name = _nameJson;
      }
      // electionDay
      var _electionDayJson = json['electionDay'] as String;
      var _electionDay;
      if (_electionDayJson == null || _electionDayJson.isEmpty) {
        _electionDay = ""; // defaults to empty string
      } else {
        _electionDay = _electionDayJson;
      }
      // division id
      var _divisionIdJson = json['ocdDivisionId'] as String;
      var _divisionId;
      if (_divisionIdJson == null || _divisionIdJson.isEmpty) {
        _divisionId = ""; // defaults to empty string
      } else {
        _divisionId = _divisionIdJson;
      }
      return NetworkElection(id: _id, name: _name, electionDay: _electionDay, divisionId: _divisionId);
    } else {
      return NetworkElection(); // defaults to empty object
    }
  }

}
