import 'package:dartz/dartz.dart';
import 'package:political_preparedness_flutter/core/error/failure.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/repositories/elections/elections_repository.dart';

class RefreshNetworkElectionListAsync extends UseCaseNoReturn<void, NoParams> {
  final ElectionsRepository repository;

  RefreshNetworkElectionListAsync(this.repository);

  // ignore: non_constant_identifier_names
  Future<Either<Failure, String>> call(NoParams) async {
    return repository.refreshNetworkElectionListAsync();
  }
}