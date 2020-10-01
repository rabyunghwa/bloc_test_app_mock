import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/usecases/elections/get_entire_saved_election_list.dart';

part 'get_saved_elections_event.dart';
part 'get_saved_elections_state.dart';

class GetSavedElectionsBloc extends Bloc<GetSavedElectionsEvent, GetSavedElectionsState> {
  final GetEntireSavedElectionList getEntireSavedElectionList;

  GetSavedElectionsBloc({@required GetEntireSavedElectionList saved})
      : assert(saved != null),
        getEntireSavedElectionList = saved, super(EmptySaved());

  @override
  Stream<GetSavedElectionsState> mapEventToState(
    GetSavedElectionsEvent event,
  ) async* {
    if (event is GetAllSavedElections) {
      final electionList = getEntireSavedElectionList(NoParams());
      await for (var elections in electionList) {
        if (elections.length > 0) {
          yield AllSavedElectionsLoaded(savedElections: elections);
        } else {
          yield EmptySaved();
        }
      }
    }
  }

}
