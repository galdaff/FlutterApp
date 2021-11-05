import 'package:equatable/equatable.dart';
import 'package:first_project/models/users_model.dart';

class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccess extends UserState {
  final User user;
  UserSuccess({this.user});
}

class UserEmptyState extends UserState {}

class UserErrorState extends UserState {
  final String message;
  UserErrorState({this.message});
}
