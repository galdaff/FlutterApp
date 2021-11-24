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
      _ProductDetailBodyState(id: productID);
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  HomeBloc homeBloc;
  final String id;
  _ProductDetailBodyState({this.id});

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(GetShoesDetail(id: id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeSuccess) {
                return ListView(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ListBody(
                            children: <Widget>[
                              Container(
                                child: Text("Name: " +
                                    state.productDetail.content.name
                                        .toString()),
                              ),
                              Container(
                                child: Text("Price: " +
                                    state.productDetail.content.price
                                        .toString()),
                              ),
                              Container(
                                child: Text("Description: " +
                                    state.productDetail.content.description
                                        .toString()),
                              ),
                              Container(
                                child: Text("Category: " +
                                    state.productDetail.content.category
                                        .toString()),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
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
