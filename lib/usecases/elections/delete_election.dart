import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/repositories/elections/elections_repository.dart';

class DeleteElection extends UseCaseNoReturn<void, Election> {
  final ElectionsRepository repository;

  DeleteElection(this.repository);

  // ignore: non_constant_identifier_names
  void call(election) async {
    return repository.deleteElection(election);
  }
}