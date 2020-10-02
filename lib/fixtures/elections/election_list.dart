import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/db/db_election.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election_response.dart';

final String dateStr1 = "2021-06-06";
final String dateStr2 = "2020-05-12";
final String dateStr3 = "2020-05-12";
final String dateStr4 = "2020-05-19";
final String dateStr5 = "2020-05-19";
final String dateStr6 = "2020-06-02";
final String dateStr7 = "2020-06-02";
final String dateStr8 = "2020-05-12";

final String id1 = "2000";
final String id2 = "4954";
final String id3 = "4957";
final String id4 = "4959";
final String id5 = "4961";
final String id6 = "4964";
final String id7 = "4989";
final String id8 = "4994";

final String name1 = "VIP Test Election";
final String name2 = "Nebraska Presidential and NetworkState Primary Election";
final String name3 = "Wisconsin 7th Congressional District Special Election";
final String name4 = "Idaho NetworkState Primary Election ";
final String name5 = "Oregon Presidential and NetworkState Primary Election";
final String name6 = "DC Presidential and NetworkState Primary Election";
final String name7 = "Rhode Island Presidential Primary Election";
final String name8 =
    "California Congressional District 25 Special General Election";

final String divisionId1 = "ocd-division/country:us";
final String divisionId2 = "ocd-division/country:us/state:ne";
final String divisionId3 = "ocd-division/country:us/state:wi";
final String divisionId4 = "ocd-division/country:us/state:id";
final String divisionId5 = "ocd-division/country:us/state:or";
final String divisionId6 = "ocd-division/country:us/district:dc";
final String divisionId7 = "ocd-division/country:us/state:ri";
final String divisionId8 = "ocd-division/country:us/state:ca";

final election1 = Election(
    id: id1,
    name: name1,
    electionDay: dateStr1,
    divisionId: divisionId1,
    followed: UNFOLLOWED);

final election2 = Election(
    id: id2,
    name: name2,
    electionDay: dateStr2,
    divisionId: divisionId2,
    followed: UNFOLLOWED);
final election3 = Election(
    id: id3,
    name: name3,
    electionDay: dateStr3,
    divisionId: divisionId3,
    followed: UNFOLLOWED);
final election4 = Election(
    id: id4,
    name: name4,
    electionDay: dateStr4,
    divisionId: divisionId4,
    followed: UNFOLLOWED);
final election5 = Election(
    id: id5,
    name: name5,
    electionDay: dateStr5,
    divisionId: divisionId5,
    followed: UNFOLLOWED);
final election6 = Election(
    id: id6,
    name: name6,
    electionDay: dateStr6,
    divisionId: divisionId6,
    followed: UNFOLLOWED);
final election7 = Election(
    id: id7,
    name: name7,
    electionDay: dateStr7,
    divisionId: divisionId7,
    followed: UNFOLLOWED);
final election8 = Election(
    id: id8,
    name: name8,
    electionDay: dateStr8,
    divisionId: divisionId8,
    followed: UNFOLLOWED);

final networkElection1 = NetworkElection(
    id: id1, name: name1, electionDay: dateStr1, divisionId: divisionId1);
final networkElection2 = NetworkElection(
    id: id2, name: name2, electionDay: dateStr2, divisionId: divisionId2);
final networkElection3 = NetworkElection(
    id: id3, name: name3, electionDay: dateStr3, divisionId: divisionId3);
final networkElection4 = NetworkElection(
    id: id4, name: name4, electionDay: dateStr4, divisionId: divisionId4);
final networkElection5 = NetworkElection(
    id: id5, name: name5, electionDay: dateStr5, divisionId: divisionId5);
final networkElection6 = NetworkElection(
    id: id6, name: name6, electionDay: dateStr6, divisionId: divisionId6);
final networkElection7 = NetworkElection(
    id: id7, name: name7, electionDay: dateStr7, divisionId: divisionId7);
final networkElection8 = NetworkElection(
    id: id8, name: name8, electionDay: dateStr8, divisionId: divisionId8);

final dbElection1 = DBElection(
    id: id1,
    name: name1,
    electionDay: dateStr1,
    divisionId: divisionId1,
    followed: UNFOLLOWED);
final dbElection2 = DBElection(
    id: id2,
    name: name2,
    electionDay: dateStr2,
    divisionId: divisionId2,
    followed: UNFOLLOWED);
final dbElection3 = DBElection(
    id: id3,
    name: name3,
    electionDay: dateStr3,
    divisionId: divisionId3,
    followed: UNFOLLOWED);
final dbElection4 = DBElection(
    id: id4,
    name: name4,
    electionDay: dateStr4,
    divisionId: divisionId4,
    followed: UNFOLLOWED);
final dbElection5 = DBElection(
    id: id5,
    name: name5,
    electionDay: dateStr5,
    divisionId: divisionId5,
    followed: UNFOLLOWED);
final dbElection6 = DBElection(
    id: id6,
    name: name6,
    electionDay: dateStr6,
    divisionId: divisionId6,
    followed: UNFOLLOWED);
final dbElection7 = DBElection(
    id: id7,
    name: name7,
    electionDay: dateStr7,
    divisionId: divisionId7,
    followed: UNFOLLOWED);
final dbElection8 = DBElection(
    id: id8,
    name: name8,
    electionDay: dateStr8,
    divisionId: divisionId8,
    followed: UNFOLLOWED);

List<NetworkElection> getMockEmptyNetworkElectionList() {
  return List<NetworkElection>();
}

List<DBElection> getMockEmptyDBElectionList() {
  return List<DBElection>();
}

List<Election> getMockEmptyElectionList() {
  return List<Election>();
}

List<Election> getMockElectionList() {
  final electionList = List<Election>();
  electionList.add(election1);
  electionList.add(election2);
  electionList.add(election3);
  electionList.add(election4);
  electionList.add(election5);
  electionList.add(election6);
  electionList.add(election7);
  electionList.add(election8);
  return electionList;
}

List<NetworkElection> getMockNetworkElectionList() {
  final networkElectionList = List<NetworkElection>();
  networkElectionList.add(networkElection1);
  networkElectionList.add(networkElection2);
  networkElectionList.add(networkElection3);
  networkElectionList.add(networkElection4);
  networkElectionList.add(networkElection5);
  networkElectionList.add(networkElection6);
  networkElectionList.add(networkElection7);
  networkElectionList.add(networkElection8);
  return networkElectionList;
}

List<DBElection> getMockDBElectionList() {
  final dbElectionList = List<DBElection>();
  dbElectionList.add(dbElection1);
  dbElectionList.add(dbElection2);
  dbElectionList.add(dbElection3);
  dbElectionList.add(dbElection4);
  dbElectionList.add(dbElection5);
  dbElectionList.add(dbElection6);
  dbElectionList.add(dbElection7);
  dbElectionList.add(dbElection8);
  return dbElectionList;
}

final networkElectionResponse = NetworkElectionResponse(
    kind: "civicinfo#electionsQueryResponse",
    elections: getMockNetworkElectionList()
);
