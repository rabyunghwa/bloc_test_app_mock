import 'package:political_preparedness_flutter/core/model/election.dart';

class DBElection extends Election {
  final String id;
  final String name;
  final String electionDay;
  final String divisionId;
  final int followed;

  DBElection(
      {this.id, this.name, this.electionDay, this.divisionId, this.followed})
      : super(
            id: id,
            name: name,
            electionDay: electionDay,
            divisionId: divisionId,
            followed: followed);
}
