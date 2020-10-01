part of 'refresh_elections_bloc.dart';

abstract class RefreshElectionsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RefreshNetworkElectionList extends RefreshElectionsEvent {}
