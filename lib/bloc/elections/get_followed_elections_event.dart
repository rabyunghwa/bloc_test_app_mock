part of 'get_followed_elections_bloc.dart';

abstract class GetFollowedElectionsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllFollowedElections extends GetFollowedElectionsEvent {}
