import 'package:equatable/equatable.dart';

class ElectionOfficial extends Equatable {
  final String name;
  final String title;
  final String phone;
  final String fax;
  final String emailAddress;

  ElectionOfficial(
      {this.name, this.title, this.phone, this.fax, this.emailAddress});

  @override
  List<Object> get props => [name, title, phone, fax, emailAddress];
}