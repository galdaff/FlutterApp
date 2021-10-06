import 'package:first_project/bloc/login/login_bloc.dart';
import 'package:first_project/bloc/login/login_state.dart';
import 'package:first_project/repo/login_repo.dart';
import 'package:first_project/screens/components/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(LoginInitState(), LoginRepository()),
        child: LoginBody(),
      ),
    );
  }
}
