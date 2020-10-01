import 'package:political_preparedness_flutter/core/model/election.dart';

class NetworkElection extends Election {
  final String id;
  final String name;
  final String electionDay;
  final String divisionId;

  NetworkElection({this.id, this.name, this.electionDay, this.divisionId})
      : super(
      id: id,
      name: name,
      electionDay: electionDay,
      divisionId: divisionId
  );

  factory NetworkElection.fromJson(dynamic json) {
    if (json != null) {
      return NetworkElection(id: json['id'] as String, name: json['name'], electionDay: json['electionDay'], divisionId: json['ocdDivisionId']);
    } else {
      return NetworkElection();
    }

  }

}
