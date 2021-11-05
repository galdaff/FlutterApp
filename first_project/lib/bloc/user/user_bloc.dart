import 'package:first_project/bloc/user/user_event.dart';
import 'package:first_project/bloc/user/user_state.dart';
import 'package:first_project/repo/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository, UserState initialState)
      : assert(repository != null),
        super(initialState);

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUserDetailEvent) {
      try {
        var data = await repository.fetchUser(event.id);
        yield UserSuccess(user: data);
      } catch (e) {
        yield UserEmptyState();
      }
    }
  }
}
