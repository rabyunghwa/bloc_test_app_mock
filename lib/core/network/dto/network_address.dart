import 'package:political_preparedness_flutter/core/model/address.dart';

class NetworkAddress extends Address {
  final String line1;
  final String line2;
  final String city;
  final String state;
  final String zip;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkAddress({this.line1, this.line2, this.city, this.state, this.zip});

  factory NetworkAddress.fromJson(dynamic json) {
    if (json != null) {
      // line1
      var _line1Json = json['line1'] as String;
      var _line1;
      if (_line1Json == null || _line1Json.isEmpty) {
        _line1 = ""; // defaults to empty string
      } else {
        _line1 = _line1Json;
      }
      // line2
      var _line2Json = json['line2'] as String;
      var _line2;
      if (_line2Json == null || _line2Json.isEmpty) {
        _line2 = ""; // defaults to empty string
      } else {
        _line2 = _line2Json;
      }
      // city
      var _cityJson = json['city'] as String;
      var _city;
      if (_cityJson == null || _cityJson.isEmpty) {
        _city = ""; // defaults to empty string
      } else {
        _city = _cityJson;
      }
      // state
      var _stateJson = json['state'] as String;
      var _state;
      if (_stateJson == null || _stateJson.isEmpty) {
        _state = ""; // defaults to empty string
      } else {
        _state = _stateJson;
      }
      // zip
      var _zipJson = json['zip'] as String;
      var _zip;
      if (_zipJson == null || _zipJson.isEmpty) {
        _zip = ""; // defaults to empty string
      } else {
        _zip = _zipJson;
      }
      return NetworkAddress(line1: _line1, line2: _line2, city: _city, state: _state, zip: _zip);
    } else {
      return NetworkAddress(); // defaults to empty object
    }
  }

  @override
  List<Object> get props => [line1, line2, city, state, zip];
}
