import 'package:equatable/equatable.dart';
import 'package:first_project/models/product_detail.dart';
import 'package:first_project/models/products_model.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitState extends HomeState {}

// class HomeLoadingState extends HomeState {}

class HomeSuccess extends HomeState {
  final ProductModel productModel;
  final ProductDetail productDetail;
  // final List<Item> items;

  HomeSuccess({this.productModel, this.productDetail});
  // : assert(items != null);
  //lúc load success thì mình nhận dc cái gì biết k
  //được nguyên cục obj chứa cái lít
  //phải khai báo v thì mmo7is lấy cái obj.list thì nómo7is ra
}

class HomeEmptyState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState({this.message});
}
