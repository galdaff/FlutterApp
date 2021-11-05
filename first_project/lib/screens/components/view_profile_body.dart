import 'package:first_project/bloc/user/user_bloc.dart';
import 'package:first_project/bloc/user/user_event.dart';
import 'package:first_project/bloc/user/user_state.dart';
import 'package:first_project/repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProfileBody extends StatefulWidget {
  final UserRepository repository;
  ViewProfileBody({this.repository});

  @override
  _ViewProfileBodyState createState() => _ViewProfileBodyState();
}

class _ViewProfileBodyState extends State<ViewProfileBody> {
  UserBloc userBloc;
  @override
  void initState() {
    // TODO: implement initState
    userBloc = BlocProvider.of<UserBloc>(context);
    userBloc
        .add(GetUserDetailEvent(id: "7581B5A9-617F-44DD-2546-08D97387D4BF"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserSuccess) {
                return Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Name: \n" +
                            state.user.content.fullName.toString() +
                            "Address: " +
                            state.user.content.address.toString(),
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
