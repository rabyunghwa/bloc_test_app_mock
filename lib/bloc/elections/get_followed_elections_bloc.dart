import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/usecases/elections/get_entire_followed_election_list.dart';

part 'get_followed_elections_event.dart';

part 'get_followed_elections_state.dart';

class GetFollowedElectionsBloc
    extends Bloc<GetFollowedElectionsEvent, GetFollowedElectionsState> {
  final GetEntireFollowedElectionList getEntireFollowedElectionList;

  GetFollowedElectionsBloc({@required GetEntireFollowedElectionList followed})
      : assert(followed != null),
        getEntireFollowedElectionList = followed, super(EmptyFollowed());

  @override
  Stream<GetFollowedElectionsState> mapEventToState(
    GetFollowedElectionsEvent event,
  ) async* {
    if (event is GetAllFollowedElections) {
      final electionList = getEntireFollowedElectionList(NoParams());
      await for (var elections in electionList) {
        if (elections.length > 0) {
          yield AllFollowedElectionsLoaded(followedElections: elections);
        } else {
          yield EmptyFollowed();
        }
      }
    }
  }

}
