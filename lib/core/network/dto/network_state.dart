import 'package:political_preparedness_flutter/core/model/state.dart';

import 'network_administration_body.dart';

class NetworkState extends State {
  final String name;
  final NetworkAdministrationBody administrationBody;

  NetworkState({this.name, this.administrationBody});

  factory NetworkState.fromJson(dynamic json) {
    if (json != null) {
      var stateName = json['name'] as String;
      var adminBodyJson = json['electionAdministrationBody'];
      var adminBody = NetworkAdministrationBody.fromJson(adminBodyJson);
      return NetworkState(
          name: stateName,
          administrationBody: adminBody
      );
    } else {
      return NetworkState();
    }

  }

  @override
  List<Object> get props => [name, administrationBody];
}
