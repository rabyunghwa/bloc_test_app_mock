part of 'get_followed_elections_bloc.dart';

abstract class GetFollowedElectionsState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyFollowed extends GetFollowedElectionsState {}

class AllFollowedElectionsLoaded extends GetFollowedElectionsState {
  final List<Election> followedElections;
  AllFollowedElectionsLoaded({@required this.followedElections});

  @override
  List<Object> get props => [followedElections];
}
