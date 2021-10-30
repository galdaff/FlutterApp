import 'package:equatable/equatable.dart';

class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartEvent extends ProductEvent {}

class AddButtonPressed extends ProductEvent {
  final String name;
  final String manufacturer;
  final int size;
  final String category;
  final String description;
  final int quantity;
  final int status;
  final int price;

  AddButtonPressed(
      {this.name,
      this.manufacturer,
      this.size,
      this.category,
      this.description,
      this.quantity,
      this.status,
      this.price});
}
