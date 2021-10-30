import 'package:first_project/bloc/product/product_bloc.dart';
import 'package:first_project/bloc/product/product_state.dart';
import 'package:first_project/repo/product_repo.dart';
import 'package:first_project/screens/components/add_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ProductBloc(ProductInitState(), ProductRepository()),
        child: AddProductBody(),
      ),
    );
  }
}
