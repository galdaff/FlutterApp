import 'package:first_project/bloc/login/login_event.dart';
import 'package:first_project/bloc/login/login_state.dart';
import 'package:first_project/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  LoginBloc(LoginState initialState, this.repository) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();

      var data =
          await repository.login(event.username, event.password.toString());
      // var info = Info.fromJson(data);
      if (data['Code'] == '200') {
        print('test data: ' + data['Code']);
        // preferences.setString("token", data['Code']['Content']['token']);
        print('test token: ' + data['Content']['token']);
        final token = data['Content']['token'];

        Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
        preferences.setString('userToken', decodedToken['Id']);
        print('test Id: ' + decodedToken['Id']);
        // updateSharedPreferences(info.content.token);
        yield LoginSuccess();
      } else if (data['Code'] == 'A01') {
        print('message : ' + data['Message']);
        yield LoginErrorState(message: data['Message']);
      }
    } else {
      yield LoginErrorState(message: 'auth error');
    }
  }
}
