import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/db/db_election.dart';
import 'package:political_preparedness_flutter/core/model/address.dart';
import 'package:political_preparedness_flutter/core/model/administration_body.dart';
import 'package:political_preparedness_flutter/core/model/election.dart';
import 'package:political_preparedness_flutter/core/model/election_official.dart';
import 'package:political_preparedness_flutter/core/model/state.dart';
import 'package:political_preparedness_flutter/core/model/voter_info.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_address.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_administration_body.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election_official.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_state.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_voter_info_response.dart';

final id = "4959";
final nameElection = "Idaho State Primary Election ";
final dateElection = "2020-05-19";
final divisionId = "ocd-division/country:us/state:id";
final networkElection = NetworkElection(
  id: id,
  name: nameElection,
  electionDay: dateElection,
  divisionId: divisionId
);
final dBElection = DBElection(
    id: id,
    name: nameElection,
    electionDay: dateElection,
    divisionId: divisionId,
    followed: UNFOLLOWED);
final election = Election(
    id: id,
    name: nameElection,
    electionDay: dateElection,
    divisionId: divisionId,
    followed: UNFOLLOWED);

final nameElectionOfficial = "Lawerence Denney";
final titleElectionOfficial = "Idaho Secretary of State";
final phoneElectionOfficial = "208-334-2852";
final emailAddressElectionOfficial = "elections@sos.idaho.gov";
final _fax = "";
final networkElectionOfficial = NetworkElectionOfficial(
  name: nameElectionOfficial,
  title: titleElectionOfficial,
  phone: phoneElectionOfficial,
  fax: _fax,
  emailAddress: emailAddressElectionOfficial
);
final electionOfficial = ElectionOfficial(
    name: nameElectionOfficial,
    title: titleElectionOfficial,
    phone: phoneElectionOfficial,
    fax: _fax,
    emailAddress: emailAddressElectionOfficial
);

List<NetworkElectionOfficial> getNetworkElectionOfficials() {
  final networkElectionOfficials = List<NetworkElectionOfficial>();
  networkElectionOfficials.add(networkElectionOfficial);
  return networkElectionOfficials;
}

List<ElectionOfficial> getElectionOfficials() {
  final electionOfficials = List<ElectionOfficial>();
  electionOfficials.add(electionOfficial);
  return electionOfficials;
}

final nameAdminBody = "IDAHO SECRETARY OF STATE ELECTION OFFICE";
final electionInfoUrl = "https://idahovotes.gov/";
final networkAdministrationBody = NetworkAdministrationBody(
  name: nameAdminBody,
  ballotInfoUrl: "",
  votingLocationFinderUrl: "",
  electionInfoUrl: electionInfoUrl,
  electionOfficials: getNetworkElectionOfficials(),
  correspondenceAddress: NetworkAddress()
);
final administrationBody = AdministrationBody(
    name: nameAdminBody,
    ballotInfoUrl: "",
    votingLocationFinderUrl: "",
    electionInfoUrl: electionInfoUrl,
    electionOfficials: getElectionOfficials(),
    correspondenceAddress: Address()
);

final nameState = "Idaho";
final networkState = NetworkState(
  name: nameState,
  administrationBody: networkAdministrationBody
);
final state = State(
    name: nameState,
    administrationBody: administrationBody
);

List<NetworkState> getNetworkStates() {
  final states = List<NetworkState>();
  states.add(networkState);
  return states;
}

List<State> getStates() {
  final states = List<State>();
  states.add(state);
  return states;
}

final networkVoterInfoResponse = NetworkVoterInfoResponse(
  election: networkElection,
  states: getNetworkStates()
);

final voterInfoResponse = VoterInfo(
  election: election,
  states: getStates()
);