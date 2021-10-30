import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductSuccess extends ProductState {}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState({this.message});
}
