import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:political_preparedness_flutter/core/db/db_election.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/usecases/voterinfo/get_election_by_id.dart' as get_election_by_id_usecase;
import 'package:political_preparedness_flutter/usecases/voterinfo/update_election.dart' as update_election_usecase;

part 'get_election_by_id_event.dart';

part 'get_election_by_id_state.dart';

class GetElectionByIdBloc
    extends Bloc<GetElectionByIdEvent, GetElectionByIdState> {
  final get_election_by_id_usecase.GetElectionById getElectionById;
  final update_election_usecase.UpdateElection updateElection;

  GetElectionByIdBloc({@required get_election_by_id_usecase
      .GetElectionById electionById, @required update_election_usecase
      .UpdateElection update})
      : assert(electionById != null),
        assert(update != null),
        getElectionById = electionById,
        updateElection = update, super(EmptyRetrieval());

  @override
  Stream<GetElectionByIdState> mapEventToState(
      GetElectionByIdEvent event,) async* {
    print("mapEventToState called...");
    if (event is GetElectionById) {
      final electionById = getElectionById(
          get_election_by_id_usecase.Params(electionId: event.electionId));
      await for (var election in electionById) {
        if (election != null) {
          yield ElectionByIdLoaded(retrievedElection: election);
        } else {
          yield EmptyRetrieval();
        }
      }
    } else if (event is UpdateElection) {
      updateElection(update_election_usecase.Params(dbElection: DBElection(
          divisionId: event.election.divisionId,
          electionDay: event.election.electionDay,
          followed: event.election.followed,
          id: event.election.id,
          name: event.election.name
      )));
      yield ElectionUpdated();
    }
  }

}
