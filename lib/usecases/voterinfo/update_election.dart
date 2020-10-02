import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:political_preparedness_flutter/core/db/db_election.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/repositories/voterinfo/voter_info_repository.dart';

class UpdateElection extends UseCaseNoReturn<void, Params> {
  final VoterInfoRepository repository;

  UpdateElection(this.repository);

  @override
  void call(params) => repository.updateElection(params.dbElection);
}

class Params extends Equatable {
  final DBElection dbElection;

  Params({@required this.dbElection});

  @override
  List<Object> get props => [dbElection];
}