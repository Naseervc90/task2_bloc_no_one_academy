import 'package:bloc/bloc.dart';
import 'package:no_one_academy_task2/blocs/product/product_event.dart';
import 'package:no_one_academy_task2/blocs/product/product_state.dart';
import 'package:no_one_academy_task2/repositories/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepository();

  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(mapLoadProductsToState);
  }

  Future<void> mapLoadProductsToState(
    LoadProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.getProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError('Failed to load products'));
    }
  }
}
