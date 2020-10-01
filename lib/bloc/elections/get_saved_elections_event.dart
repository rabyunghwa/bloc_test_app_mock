part of 'get_saved_elections_bloc.dart';

abstract class GetSavedElectionsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAllSavedElections extends GetSavedElectionsEvent {}

