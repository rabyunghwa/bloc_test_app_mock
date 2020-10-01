import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/usecases/elections/refresh_network_election_list_async.dart';

part 'refresh_elections_event.dart';

part 'refresh_elections_state.dart';

class RefreshElectionsBloc
    extends Bloc<RefreshElectionsEvent, RefreshElectionsState> {
  final RefreshNetworkElectionListAsync refreshNetworkElectionListAsync;

  RefreshElectionsBloc({@required RefreshNetworkElectionListAsync refresh})
      : assert(refresh != null),
        refreshNetworkElectionListAsync = refresh, super(Refreshing());

  @override
  Stream<RefreshElectionsState> mapEventToState(
    RefreshElectionsEvent event,
  ) async* {
    if (event is RefreshNetworkElectionList) {
      final refreshEither = await refreshNetworkElectionListAsync(
        NoParams(),
      );
      yield Refreshing();
      yield refreshEither.fold(
        (failure) {
          if (failure is NoNetworkFailure) {
            return Error(message: NO_NETWORK_FAILURE_MESSAGE);
          } else if (failure is ServerFailure) {
            return Error(message: SERVER_FAILURE_MESSAGE);
          } else {
            return Error(message: SERVER_FAILURE_MESSAGE);
          }
        },
        (_) => Refreshed(),
      );
    }
  }

}
