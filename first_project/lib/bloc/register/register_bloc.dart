import 'package:first_project/bloc/register/register_event.dart';
import 'package:first_project/bloc/register/register_state.dart';
import 'package:first_project/repo/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepository repository;
  RegisterBloc(RegisterState initialState, this.repository)
      : super(initialState);
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is StartEvent) {
      yield RegisterInitState();
    } else if (event is RegisterButtonPressed) {
      yield RegisterLoadingState();
      var data = await repository.register(
          event.username, event.password, event.fullName, event.address);
      if (data['Code'] == '200') {
        print('test data: ' + data['Code']);
        yield RegisterSuccess();
      } else if (data['Code'] == 'A05') {
        print('message: ' + data['Message']);
        yield RegisterErrorState(message: data['Message']);
      }
    } else {
      yield RegisterErrorState(message: 'auth error');
    }
  }
}
