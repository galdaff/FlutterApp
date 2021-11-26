import 'package:first_project/bloc/home/home_bloc.dart';
import 'package:first_project/bloc/home/home_event.dart';
import 'package:first_project/bloc/home/home_state.dart';
import 'package:first_project/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailBody extends StatefulWidget {
  final HomeRepository homeRepository;
  final String productID;
  ProductDetailBody({this.homeRepository, this.productID});

  @override
  _ProductDetailBodyState createState() =>
      _ProductDetailBodyState(id: productID.toString());
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  HomeBloc homeBloc;
  final String id;
  _ProductDetailBodyState({this.id});

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(GetShoesDetail(id: id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductSuccess) {
                return Scaffold(
                  body: SafeArea(
                    child: Container(
                      height: height,
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Shoes Name: " +
                                state.productDetail.content.name.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Text("");
            },
          ),
        ),
      ),
    );
  }
}
