import 'package:no_one_academy_task2/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}
