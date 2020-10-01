import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/repositories/voterinfo/voter_info_repository.dart';

class GetElectionById extends UseCaseStream<Election, Params> {
  final VoterInfoRepository repository;

  GetElectionById(this.repository);

  @override
  Stream<Election> call(params) => repository.getElectionById(params.electionId);
}

class Params extends Equatable {
  final int electionId;

  Params({@required this.electionId});

  @override
  List<Object> get props => [electionId];
}