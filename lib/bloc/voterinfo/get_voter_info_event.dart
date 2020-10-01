part of 'get_voter_info_bloc.dart';

abstract class GetVoterInfoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RefreshVoterInfo extends GetVoterInfoEvent {
  final String addressString;
  final int electionId;

  RefreshVoterInfo({@required this.addressString, @required this.electionId});

  @override
  List<Object> get props => [addressString, electionId];
}
