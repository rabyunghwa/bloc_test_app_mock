import 'dart:core';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String line1;
  final String line2;
  final String city;
  final String state;
  final String zip;

  Address(
      {this.line1, this.line2, this.city, this.state, this.zip});

  @override
  List<Object> get props => [line1, line2, city, state, zip];
}
