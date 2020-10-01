part of 'get_saved_elections_bloc.dart';

abstract class GetSavedElectionsState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptySaved extends GetSavedElectionsState {}

class AllSavedElectionsLoaded extends GetSavedElectionsState {
  final List<Election> savedElections;
  AllSavedElectionsLoaded({@required this.savedElections});

  @override
  List<Object> get props => [savedElections];
}
