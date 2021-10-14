import 'package:equatable/equatable.dart';
// muốn add maa6ys cái package thì vô pub.dev rôi search ra thôi, add thì vô file pubspec.yaml để add

class HomeEvent extends Equatable {
  @override
  List<Object> get props => []; //mấy này syntax thoioi, đó giờ t để vậy
}

class StartEvent extends HomeEvent {
} //coi coi cái chức năng nào có event gì thì ghi vào, ở đây có 2 cái

class SearchButtonPressed extends HomeEvent {
  final String productName;
  SearchButtonPressed({this.productName});
}
