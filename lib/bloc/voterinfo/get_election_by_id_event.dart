part of 'get_election_by_id_bloc.dart';

abstract class GetElectionByIdEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetElectionById extends GetElectionByIdEvent {
  final int electionId;

  GetElectionById({@required this.electionId});

  @override
  List<Object> get props => [electionId];
}

class UpdateElection extends GetElectionByIdEvent {
  final Election election;

  UpdateElection({@required this.election});

  @override
  List<Object> get props => [election];
}
