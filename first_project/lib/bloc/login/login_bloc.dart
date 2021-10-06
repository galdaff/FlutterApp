import 'package:first_project/bloc/login/login_event.dart';
import 'package:first_project/bloc/login/login_state.dart';
import 'package:first_project/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  LoginBloc(LoginState initialState, this.repository) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginButtonPressed) {
      yield LoginLoadingState();

      var data = await repository.login(event.username, event.password);
      if (data['Code'] == '200') {
        print('test data: ' + data['Code']);

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
