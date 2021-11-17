import 'package:first_project/bloc/user/user_bloc.dart';
import 'package:first_project/bloc/user/user_event.dart';
import 'package:first_project/bloc/user/user_state.dart';
import 'package:first_project/repo/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewProfileBody extends StatefulWidget {
  final UserRepository repository;
  ViewProfileBody({this.repository});

  @override
  _ViewProfileBodyState createState() => _ViewProfileBodyState();
}

class _ViewProfileBodyState extends State<ViewProfileBody> {
  UserBloc userBloc;
  var userMap;

  // Future getSavedInfo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userMap = prefs.getString('userToken');
  //   });

  //   return userMap;
  // }

  // User userDetail;
  // getSavedInfo() async {
  //   debugger();
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   userMap = preferences.getString('userToken');
  //   return User.fromJson(userMap);
  // }

  // String _decodeBase64(String str) {
  //   String output = str.replaceAll('-', '+').replaceAll('_', '/');

  //   switch (output.length % 4) {
  //     case 0:
  //       break;
  //     case 2:
  //       output += '==';
  //       break;
  //     case 3:
  //       output += '=';
  //       break;
  //     default:
  //       throw Exception('Illegal base64url string!"');
  //   }

  //   return utf8.decode(base64Url.decode(output));
  // }

  // Future<Map<String, dynamic>> parseJwt(String userMap) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   userMap = prefs.getString('userToken');
  //   final parts = userMap.split('.');
  //   if (parts.length != 3) {
  //     throw Exception('invalid token');
  //   }

  //   final payload = _decodeBase64(parts[1]);
  //   final payloadMap = json.decode(payload);
  //   if (payloadMap is! Map<String, dynamic>) {
  //     throw Exception('invalid payload');
  //   }

  //   return payloadMap;
  // }

  // Future _decodeJwt(String token) {
  //   Map<String, dynamic> tokenDecoded = parseJwt(token);
  //   String id = tokenDecoded['Id'];
  // }
  // Future decode() async {
  //   Map<String, dynamic> decodedToken = JwtDecoder.decode(userMap);
  //   setState(() {
  //     idDecoded = decodedToken["Id"].toString();
  //   });
  //   return idDecoded;
  // }
  // Future getId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   userMap = prefs.getString("userToken");
  // }

  @override
  void initState() {
    // TODO: implement initState
    // getSavedInfo();
    // decode();

    // Map<String, dynamic> decodedToken = JwtDecoder.decode(userMap);
    // Map<String, dynamic> decodedToken = Jwt.parseJwt(userMap);
    // getId();
    // Timer(Duration(microseconds: 250), () {
    //   userBloc = BlocProvider.of<UserBloc>(context);
    //   userBloc.add(GetUserDetailEvent(id: userMap));
    // });
    SharedPreferences.getInstance().then((prefValue) => {
          setState(() {
            userMap = prefValue.getString('userToken') ?? "";
            userBloc = BlocProvider.of<UserBloc>(context);
            userBloc.add(GetUserDetailEvent(id: userMap));
          })
        });
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
                        "Name: \n" + state.user.content.fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.orangeAccent,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Address: \n" + state.user.content.address,
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
              return Text("failed");
            },
          ),
        ),
      ),
    );
  }
}
