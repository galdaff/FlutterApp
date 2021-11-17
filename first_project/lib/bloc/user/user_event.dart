import 'package:equatable/equatable.dart';

class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends UserEvent {}

class GetUserDetailEvent extends UserEvent {
  // Map<String, dynamic> id;
  String id;
  GetUserDetailEvent({this.id});
}
