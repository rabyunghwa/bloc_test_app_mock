import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/usecases/usecase.dart';
import 'package:political_preparedness_flutter/repositories/elections/elections_repository.dart';

class GetEntireSavedElectionList extends UseCaseStream<List<Election>, NoParams> {
  final ElectionsRepository repository;

  GetEntireSavedElectionList(this.repository);

  // ignore: non_constant_identifier_names
  Stream<List<Election>> call(NoParams) => repository.entireSavedElectionList;
}
