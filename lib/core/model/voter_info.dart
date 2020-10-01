import 'package:equatable/equatable.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';

import 'state.dart';

class VoterInfo extends Equatable {
  final Election election;
  final String pollingLocations;
  final String contests;
  final List<State> states;

  VoterInfo(
      {this.election, this.pollingLocations, this.contests, this.states});

  @override
  List<Object> get props => [election, pollingLocations, contests, states];
}