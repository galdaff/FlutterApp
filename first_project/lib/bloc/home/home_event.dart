import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetShoesEvent extends HomeEvent {
  final int pageIndex;
  final int pageSize;

  GetShoesEvent({this.pageIndex, this.pageSize});
}

class GetShoesDetail extends HomeEvent {
  final String id;
  GetShoesDetail({this.id});
}
