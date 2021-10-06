import 'package:first_project/bloc/register/register_bloc.dart';
import 'package:first_project/bloc/register/register_event.dart';
import 'package:first_project/bloc/register/register_state.dart';
import 'package:first_project/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBody extends StatefulWidget {
  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();

  var registerBloc;
  bool usernameValidate = false;
  bool passwordValidate = false;
  bool confirmValidate = false;
  bool fullNameValidate = false;
  bool addressValidate = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterInitState) {
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
                      'Register',
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
                                  ? 'Username can\'t be empty'
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
                                  ? 'Password can\'t be empty'
                                  : null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: confirm,
                            obscureText: true,
                            style: TextStyle(fontSize: 22.0),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Confirm Password',
                              errorText: confirmValidate
                                  ? 'Password can\'t be empty'
                                  : null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (val) {
                              if (val != password.text) {
                                return "Password is not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: fullName,
                            obscureText: true,
                            style: TextStyle(fontSize: 22.0),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'FullName',
                              errorText: fullNameValidate
                                  ? 'FullName can\'t be empty'
                                  : null,
                              labelStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: address,
                            obscureText: true,
                            style: TextStyle(fontSize: 22.0),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Address',
                              errorText: addressValidate
                                  ? 'Address can\'t be empty'
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
                              child: Text('Register'),
                              onPressed: () {
                                print(username.text);
                                print(password.text);
                                print(fullName.text);
                                print(address.text);

                                if (username.text.isEmpty &&
                                    password.text.isEmpty &&
                                    confirm.text.isEmpty &&
                                    fullName.text.isEmpty &&
                                    address.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = true;
                                    passwordValidate = true;
                                    confirmValidate = true;
                                    fullNameValidate = true;
                                    addressValidate = true;
                                  });
                                } else if (username.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = true;
                                    passwordValidate = false;
                                    confirmValidate = false;
                                    fullNameValidate = false;
                                    addressValidate = false;
                                  });
                                } else if (password.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = true;
                                    confirmValidate = false;
                                    fullNameValidate = false;
                                    addressValidate = false;
                                  });
                                } else if (confirm.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = false;
                                    confirmValidate = true;
                                    fullNameValidate = false;
                                    addressValidate = false;
                                  });
                                } else if (fullName.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = false;
                                    confirmValidate = false;
                                    fullNameValidate = true;
                                    addressValidate = false;
                                  });
                                } else if (address.text.isEmpty) {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = false;
                                    confirmValidate = false;
                                    fullNameValidate = false;
                                    addressValidate = true;
                                  });
                                } else {
                                  setState(() {
                                    usernameValidate = false;
                                    passwordValidate = false;
                                    confirmValidate = false;
                                    fullNameValidate = false;
                                    addressValidate = false;
                                  });
                                  registerBloc.add(RegisterButtonPressed(
                                      username: username.text,
                                      password: password.text,
                                      fullName: fullName.text,
                                      address: address.text));
                                }
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
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is RegisterLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RegisterSuccess) {
          Future.delayed(Duration.zero, () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => LoginScreen()));
          });
        } else if (state is RegisterErrorState) {
          return Text(state.message);
        }
        return Text('');
      },
    );
  }
}
