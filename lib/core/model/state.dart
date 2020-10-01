import 'package:equatable/equatable.dart';

import 'administration_body.dart';

class State extends Equatable {
  final String name;
  final AdministrationBody administrationBody;

  State(
      {this.name, this.administrationBody});

  @override
  List<Object> get props => [name, administrationBody];
}