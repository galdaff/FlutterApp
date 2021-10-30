import 'package:first_project/bloc/product/product_event.dart';
import 'package:first_project/bloc/product/product_state.dart';
import 'package:first_project/repo/product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;
  ProductBloc(ProductState initialState, this.repository) : super(initialState);
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is StartEvent) {
      yield ProductInitState();
    } else if (event is AddButtonPressed) {
      yield ProductLoadingState();
      var data = await repository.addProduct(
          event.name,
          event.manufacturer,
          event.size,
          event.category,
          event.description,
          event.quantity,
          event.status,
          event.price);
      if (data['Code'] == '200') {
        print('test-data: ' + data['Code']);
        yield ProductSuccess();
      } else {
        yield ProductErrorState(message: 'auth error');
      }
    }
  }
}
