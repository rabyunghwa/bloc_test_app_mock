part of 'get_voter_info_bloc.dart';

abstract class GetVoterInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class Refreshing extends GetVoterInfoState {}

class Refreshed extends GetVoterInfoState {
  final VoterInfo voterInfo;
  Refreshed({@required this.voterInfo});

  @override
  List<Object> get props => [voterInfo];
}

class Error extends GetVoterInfoState {
  final String message;
  Error({@required this.message});

  @override
  List<Object> get props => [message];
}