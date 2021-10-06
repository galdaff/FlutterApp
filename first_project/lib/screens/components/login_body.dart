import 'package:first_project/bloc/login/login_bloc.dart';
import 'package:first_project/bloc/login/login_event.dart';
import 'package:first_project/bloc/login/login_state.dart';
import 'package:first_project/screens/register_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  var loginBloc;
  bool usernameValidate = false;
  bool passwordValidate = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                height: height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Reaperr',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: username,
                            style: TextStyle(fontSize: 22.0),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Username',
                              errorText: usernameValidate
                                  ? 'Username Can\'t Be Empty'
                                  : null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: password,
                            obscureText: true,
                            style: TextStyle(fontSize: 22.0),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Password',
                              errorText: passwordValidate
                                  ? 'Password Can\'t Be Empty'
                                  : null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: 150.0,
                            child: ElevatedButton(
                              child: Text('Login'),
                              onPressed: () {
                                print(username.text);
                                print(password.text);

                                if (username.text.isEmpty &&
                                    password.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = true;
                                    passwordValidate = true;
                                  });
                                } else if (username.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = true;
                                    passwordValidate = false;
                                  });
                                } else if (password.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = true;
                                  });
                                } else {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = false;
                                  });
                                  loginBloc.add(LoginButtonPressed(
                                      username: username.text,
                                      password: password.text));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent,
                                  textStyle: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            width: 150.0,
                            child: ElevatedButton(
                              child: Text('Register'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => RegisterScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orangeAccent,
                                  textStyle: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is LoginLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoginSuccess) {
          // SchedulerBinding.instance.addPostFrameCallback((_) {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (_) => HomeScreen()));
          // });
          Future.delayed(Duration.zero, () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => RegisterScreen()));
          });
        } else if (state is LoginErrorState) {
          return Text(state.message);
          // final snackBar = SnackBar(
          //   content: Text(state.message.toString()),
          //   action: SnackBarAction(
          //     label: 'Undo',
          //     onPressed: () {},
          //   ),
          // );
          // Future.delayed(Duration.zero, () async {
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // });
        }
        return Text('');
      },
    );
  }
}
