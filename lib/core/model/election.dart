import 'package:equatable/equatable.dart';

class Election extends Equatable {
  final String id;
  final String name;
  final String electionDay;
  final String divisionId;
  final int followed;

  Election(
      {this.id, this.name, this.electionDay, this.divisionId, this.followed});

  @override
  List<Object> get props => [id, name, electionDay, divisionId];
}
