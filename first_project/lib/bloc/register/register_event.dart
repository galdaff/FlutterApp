import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends RegisterEvent {}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String password;
  final String fullName;
  final String address;

  RegisterButtonPressed(
      {this.username, this.password, this.fullName, this.address});
}
