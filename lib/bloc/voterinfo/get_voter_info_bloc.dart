import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/model/voter_info.dart';
import 'package:political_preparedness_flutter/usecases/voterinfo/refresh_voter_info_async.dart';

part 'get_voter_info_event.dart';

part 'get_voter_info_state.dart';

class GetVoterInfoBloc extends Bloc<GetVoterInfoEvent, GetVoterInfoState> {
  final RefreshVoterInfoAsync refreshVoterInfoAsync;

  GetVoterInfoBloc({@required RefreshVoterInfoAsync voterInfo})
      : assert(voterInfo != null),
        refreshVoterInfoAsync = voterInfo, super(Refreshing());

  @override
  Stream<GetVoterInfoState> mapEventToState(
    GetVoterInfoEvent event,
  ) async* {
    if (event is RefreshVoterInfo) {
      final refreshEither = await refreshVoterInfoAsync(
        Params(
            officialOnly: true,
            electionId: event.electionId,
            address: event.addressString,
            allAvailable: true),
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
        (voterInfo) => Refreshed(voterInfo: voterInfo),
      );
    }
  }

}
