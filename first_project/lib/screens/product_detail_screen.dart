import 'package:first_project/bloc/home/home_bloc.dart';
import 'package:first_project/bloc/home/home_state.dart';
import 'package:first_project/repo/home_repo.dart';
import 'package:first_project/screens/components/product_detail_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;
  ProductDetailScreen({this.productId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(HomeRepository(), HomeInitState()),
        child: ProductDetailBody(productID: this.productId),
      ),
    );
  }
}
