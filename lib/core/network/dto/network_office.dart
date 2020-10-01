import 'package:equatable/equatable.dart';

class NetworkOffice extends Equatable {
  final String name;
  final String divisionId;
  final List<int> officials;

  NetworkOffice({this.name, this.divisionId, this.officials});

  @override
  List<Object> get props => [name, divisionId, officials];
}
