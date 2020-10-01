part of 'get_election_by_id_bloc.dart';

abstract class GetElectionByIdState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyRetrieval extends GetElectionByIdState {}

class ElectionByIdLoaded extends GetElectionByIdState {
  final Election retrievedElection;
  ElectionByIdLoaded({@required this.retrievedElection});

  @override
  List<Object> get props => [retrievedElection];
}

class ElectionUpdated extends GetElectionByIdState {}

