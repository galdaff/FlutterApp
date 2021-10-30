import 'package:first_project/bloc/home/home_bloc.dart';
import 'package:first_project/bloc/home/home_event.dart';
import 'package:first_project/bloc/home/home_state.dart';
import 'package:first_project/repo/home_repo.dart';
// import 'package:first_project/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'categories.dart';
// import 'discount_banner.dart';
// import 'home_header.dart';
// import 'popular_product.dart';
// import 'special_offers.dart';

class HomeBody extends StatefulWidget {
  final HomeRepository homeRepository;

  HomeBody({this.homeRepository});

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HomeBloc homeBloc;

  @override
  void initState() {
    //muốn cho nó load tụ động khiu voo trang home thì add cái event vô trong cái initstate này, hàm initstate nó tự chạy lần dầu tiên
    // TODO: implement initState
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(GetShoesEvent(
        pageIndex: 1, pageSize: 10)); //mốt mỗi cái đoit tên dùm cái
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
                return Column(
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                        itemCount: state.productModel.content.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Icon(Icons.list),
                            trailing: Text(state
                                .productModel.content.items[index].price
                                .toString()),
                            title: Text(
                                state.productModel.content.items[index].name),
                          ); //giờ t muốn lấy tên product ra thì sao, thửu coi
                        },
                      ),
                    ), //phai k, k//sao đếm dc length của list, gõ thử coi
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