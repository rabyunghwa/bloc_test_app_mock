import 'package:equatable/equatable.dart';

import 'network_office.dart';
import 'network_official.dart';

class NetworkRepresentativeResponse extends Equatable {
  final List<NetworkOffice> networkOffices;
  final List<NetworkOfficial> officials;

  NetworkRepresentativeResponse({this.networkOffices, this.officials});

  @override
  List<Object> get props => [networkOffices, officials];
}
