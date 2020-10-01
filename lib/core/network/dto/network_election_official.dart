import 'package:political_preparedness_flutter/core/model/election_official.dart';

class NetworkElectionOfficial extends ElectionOfficial {
  final String name;
  final String title;
  final String phone;
  final String fax;
  final String emailAddress;

  NetworkElectionOfficial(
      {this.name, this.title, this.phone, this.fax, this.emailAddress});

  factory NetworkElectionOfficial.fromJson(dynamic json) {
    if (json != null) {
      return NetworkElectionOfficial(
          name: json['name'] as String,
          title: json['title'] as String,
          phone: json['officePhoneNumber'] as String,
          fax: json['faxNumber'] as String,
          emailAddress: json['emailAddress'] as String);
    } else {
      return NetworkElectionOfficial();
    }
  }

  @override
  List<Object> get props => [name, title, phone, fax, emailAddress];
}
