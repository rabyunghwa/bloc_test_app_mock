import 'package:political_preparedness_flutter/core/model/election_official.dart';

// @JsonSerializable(nullable: true)
class NetworkElectionOfficial extends ElectionOfficial {
  final String name;
  final String title;
  final String phone;
  final String fax;
  final String emailAddress;

  /// using curly braces { } to specify named optional parameters. You must use the parameter name when calling the function.
  /// using square brackets [ ] to make them as optional positional parameters.
  /// Division division = Division(id: "", country: "", state: "");
  NetworkElectionOfficial(
      {this.name, this.title, this.phone, this.fax, this.emailAddress});

  factory NetworkElectionOfficial.fromJson(dynamic json) {
    if (json != null) {
      // name
      var _nameJson = json['name'] as String;
      var _name;
      if (_nameJson == null || _nameJson.isEmpty) {
        _name = ""; // defaults to empty string
      } else {
        _name = _nameJson;
      }
      // title
      var _titleJson = json['title'] as String;
      var _title;
      if (_titleJson == null || _titleJson.isEmpty) {
        _title = ""; // defaults to empty string
      } else {
        _title = _titleJson;
      }
      // office phone number
      var _officePhoneNumberJson = json['officePhoneNumber'] as String;
      var _officePhoneNumber;
      if (_officePhoneNumberJson == null || _officePhoneNumberJson.isEmpty) {
        _officePhoneNumber = ""; // defaults to empty string
      } else {
        _officePhoneNumber = _officePhoneNumberJson;
      }
      // fax number
      var _faxNumberJson = json['faxNumber'] as String;
      var _faxNumber;
      if (_faxNumberJson == null || _faxNumberJson.isEmpty) {
        _faxNumber = ""; // defaults to empty string
      } else {
        _faxNumber = _faxNumberJson;
      }
      // email address
      var _emailAddressJson = json['emailAddress'] as String;
      var _emailAddress;
      if (_emailAddressJson == null || _emailAddressJson.isEmpty) {
        _emailAddress = ""; // defaults to empty string
      } else {
        _emailAddress = _emailAddressJson;
      }
      return NetworkElectionOfficial(
          name: _name,
          title: _title,
          phone: _officePhoneNumber,
          fax: _faxNumber,
          emailAddress: _emailAddress);
    } else {
      return NetworkElectionOfficial(); // defaults to empty object
    }
  }

  @override
  List<Object> get props => [name, title, phone, fax, emailAddress];
}
