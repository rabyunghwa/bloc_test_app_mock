part of 'refresh_elections_bloc.dart';

abstract class RefreshElectionsState extends Equatable {
  @override
  List<Object> get props => [];
}

class Refreshing extends RefreshElectionsState {}

class Refreshed extends RefreshElectionsState {}

class Error extends RefreshElectionsState {
  final String message;
  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
