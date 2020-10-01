import 'package:equatable/equatable.dart';

class NetworkChannel extends Equatable {
  final String type;
  final String id;

  NetworkChannel({this.type, this.id});

  @override
  List<Object> get props => [type, id];
}
