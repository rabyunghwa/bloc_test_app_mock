import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/model/voter_info.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/repositories/voterinfo/voter_info_repository.dart';

class RefreshVoterInfoAsync extends UseCase<VoterInfo, Params> {
  final VoterInfoRepository repository;

  RefreshVoterInfoAsync(this.repository);

  @override
  Future<Either<Failure, VoterInfo>> call(params) => repository.getVoterInfoAsync(params.address, params.electionId, params.officialOnly, params.allAvailable);
}

class Params extends Equatable {
  final String address;
  final int electionId;
  final bool officialOnly;
  final bool allAvailable;

  Params({@required this.address, @required this.electionId, @required this.officialOnly, @required this.allAvailable});

  @override
  List<Object> get props => [address, electionId, officialOnly, allAvailable];
}