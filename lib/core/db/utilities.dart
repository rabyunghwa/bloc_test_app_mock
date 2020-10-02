import 'package:political_preparedness_flutter/core/network/dto/network_election.dart';

import '../constants.dart';
import 'db_election.dart';

List<DBElection> fromNetworkElection(List<NetworkElection> networkElections) {
    List<DBElection> dbElections = List<DBElection>();
    networkElections.forEach((networkElection) {
        dbElections.add(DBElection(
                id: networkElection.id,
                name: networkElection.name,
        electionDay: networkElection.electionDay,
        divisionId: networkElection.divisionId,
        followed: UNFOLLOWED));
    });
    return dbElections;
}