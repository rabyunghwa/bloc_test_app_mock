import 'dart:core';

import 'package:equatable/equatable.dart';

import 'address.dart';
import 'election_official.dart';

class AdministrationBody extends Equatable {
  final String name;
  final String electionInfoUrl;
  final String votingLocationFinderUrl;
  final String ballotInfoUrl;
  final Address correspondenceAddress;
  final List<ElectionOfficial> electionOfficials;

  AdministrationBody(
      {this.name, this.electionInfoUrl, this.votingLocationFinderUrl, this.ballotInfoUrl, this.correspondenceAddress, this.electionOfficials});

  @override
  List<Object> get props => [name, electionInfoUrl, votingLocationFinderUrl, ballotInfoUrl, correspondenceAddress, electionOfficials];
}