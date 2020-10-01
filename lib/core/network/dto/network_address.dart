import 'package:political_preparedness_flutter/core/model/address.dart';

class NetworkAddress extends Address {
  final String line1;
  final String line2;
  final String city;
  final String state;
  final String zip;

  NetworkAddress({this.line1, this.line2, this.city, this.state, this.zip});

  factory NetworkAddress.fromJson(dynamic json) {
    if (json != null) {
      return NetworkAddress(line1: json['line1'] as String, line2: json['line2'] as String, city: json['city'] as String, state: json['state'] as String, zip: json['zip'] as String);
    } else {
      return NetworkAddress();
    }
  }

  @override
  List<Object> get props => [line1, line2, city, state, zip];
}
