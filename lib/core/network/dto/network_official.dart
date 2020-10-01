import 'package:equatable/equatable.dart';

import 'network_address.dart';
import 'network_channel.dart';

class NetworkOfficial extends Equatable {
  final String name;
  final List<NetworkAddress> address;
  final String party;
  final List<String> phones;
  final List<String> urls;
  final String photoUrl;
  final List<NetworkChannel> channels;

  NetworkOfficial(
      {this.name,
      this.address,
      this.party,
      this.phones,
      this.urls,
      this.photoUrl,
      this.channels});

  @override
  List<Object> get props =>
      [name, address, party, phones, urls, photoUrl, channels];
}
