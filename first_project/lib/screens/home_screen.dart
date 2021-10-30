import 'package:first_project/bloc/home/home_bloc.dart';
import 'package:first_project/bloc/home/home_state.dart';
import 'package:first_project/repo/home_repo.dart';
import 'package:first_project/screens/components/home_body.dart';
// import 'package:first_project/screens/components/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeScreen extends StatefulWidget {
//   final HomeRepository homeRepository;

//   HomeScreen({this.homeRepository});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   HomeBloc _homeBloc;
//   @override
//   void initState() {
//     super.initState();
//     _homeBloc = HomeBody(homeRepository: widget.homeRepository) as HomeBloc;
//   }

//   @override
//   void didUpdateWidget(covariant HomeScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       bloc:
//       body: BlocProvider(
//           create: (context) => HomeBloc(HomeRepository(), HomeInitState())),
//     );
//   }
// }
class HomeScreen extends StatelessWidget {
  //biets stateless với stateful k, alo? rồi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeBloc(HomeRepository(), HomeInitState()),
        child: HomeBody(),
      ),
    );
  }
}
