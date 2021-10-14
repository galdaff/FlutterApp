import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({this.message});
}
