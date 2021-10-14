import 'package:first_project/bloc/home/home_event.dart';
import 'package:first_project/bloc/home/home_state.dart';
import 'package:first_project/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;
  HomeBloc(HomeState initialState, this.repository) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is StartEvent) {
      yield HomeInitState();
    } else if (event is SearchButtonPressed) {
      yield HomeLoadingState();

      var data = await repository.home(event.productName);
      if (data['Code'] == '200') {
        print('test data: ' + data['Code']);
        yield HomeSuccess();
      }
    } else {
      yield HomeErrorState(message: 'auth error');
    }
  }
}
