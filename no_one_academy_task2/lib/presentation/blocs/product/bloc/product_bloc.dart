import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:no_one_academy_task2/domain/entities/product.dart';
import 'package:no_one_academy_task2/domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    try {
      final products = await getProducts.execute();
      emit(ProductLoaded(products: products));
    } catch (_) {
      emit(ProductError(error: 'Failed to load products'));
    }
  }
}
