import 'package:political_preparedness_flutter/core/model/state.dart';

import 'network_administration_body.dart';

// @JsonSerializable(nullable: true)
class NetworkState extends State {
  final String name;
  final NetworkAdministrationBody administrationBody;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkState({this.name, this.administrationBody});

  factory NetworkState.fromJson(dynamic json) {
    if (json != null) {
      // state name
      var _nameJson = json['name'] as String;
      var _stateName;
      if (_nameJson == null || _nameJson.isEmpty) {
        _stateName = ""; // defaults to empty string
      } else {
        _stateName = _nameJson;
      }
      // admin body
      var _adminBodyJson = json['electionAdministrationBody'];
      var _adminBody = NetworkAdministrationBody.fromJson(_adminBodyJson);
      return NetworkState(
          name: _stateName,
          administrationBody: _adminBody
      );
    } else {
      return NetworkState(); // defaults to empty object
    }

  }

  @override
  List<Object> get props => [name, administrationBody];
}
