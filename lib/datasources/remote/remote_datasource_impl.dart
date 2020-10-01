import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:political_preparedness_flutter/core/constants.dart';
import 'package:political_preparedness_flutter/core/error/exception.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_election_response.dart';
import 'package:political_preparedness_flutter/core/network/dto/network_voter_info_response.dart';
import 'package:political_preparedness_flutter/datasources/remote/remote_datasource.dart';
// Note how "as" avoids conflict. We rename the file name to something else and then use "NewFileName.class" to refer to the actual class (http.Client).
import 'package:http/http.dart' as http;

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<List<NetworkElection>> getNetworkElectionList() async {

    final response = await client.get(
      '${BASE_URL}elections?key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return NetworkElectionResponse.fromJson(json.decode(response.body)).elections;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NetworkVoterInfoResponse> getVoterInfoAsync(String address, int electionId, bool officialOnly, bool allAvailable) async {
    final response = await client.get(
      '${BASE_URL}voterinfo?address=$address&electionId=$electionId&returnAllAvailableData=$allAvailable&officialOnly=$officialOnly&key=$API_KEY',
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return NetworkVoterInfoResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}