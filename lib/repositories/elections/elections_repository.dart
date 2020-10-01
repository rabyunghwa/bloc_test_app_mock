import 'package:dartz/dartz.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';

import '../../core/error/failure.dart';

abstract class ElectionsRepository {
  Stream<List<Election>> get entireSavedElectionList;
  Stream<List<Election>> get entireFollowedElectionList;
  Future<Either<Failure, String>> refreshNetworkElectionListAsync();
  Future<void> deleteElection(Election election);
}