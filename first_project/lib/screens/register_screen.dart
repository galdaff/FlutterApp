import 'package:first_project/bloc/register/register_bloc.dart';
import 'package:first_project/bloc/register/register_state.dart';
import 'package:first_project/repo/register_repo.dart';
import 'package:first_project/screens/components/register_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) =>
                RegisterBloc(RegisterInitState(), RegisterRepository()),
            child: RegisterBody()));
  }
}
