import 'package:first_project/bloc/user/user_bloc.dart';
import 'package:first_project/bloc/user/user_event.dart';
import 'package:first_project/bloc/user/user_state.dart';
import 'package:first_project/repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfileBody extends StatefulWidget {
  final UserRepository repository;
  ViewProfileBody({this.repository});

  @override
  _ViewProfileBodyState createState() => _ViewProfileBodyState();
}

class _ViewProfileBodyState extends State<ViewProfileBody> {
  UserBloc userBloc;

  @override
  void initState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(preferences.getString("token"));
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
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.orangeAccent,
                        ),
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
