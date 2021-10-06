import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String message;
  RegisterErrorState({this.message});
}
