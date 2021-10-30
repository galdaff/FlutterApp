import 'package:first_project/bloc/home/home_event.dart';
import 'package:first_project/bloc/home/home_state.dart';
import 'package:first_project/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository, HomeState initialState)
      : assert(repository != null),
        super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetShoesEvent) {
      //startevent là gọi api luôn
      try {
        var data =
            await repository.fetchProduct(event.pageSize, event.pageIndex);
        yield HomeSuccess(
            productModel:
                data); // api trả về obj, làm thì nhìn coi api nó quăng ra cái gì
      } catch (e) {
        yield HomeEmptyState();
      }
      // yield HomeLoadingState();
      // try {
      //   final List<Item> items =
      //       await repository.fetchProduct(event.pageSize, event.pageIndex);
      //   if (items.length == 0) {
      //     yield HomeEmptyState();
      //   } else {
      //     yield HomeSuccess(items: items);
      //   }
      // } catch (_) {
      //   yield HomeErrorState();
      // }
    }
  }
}
