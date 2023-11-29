import 'package:no_one_academy_task2/model/product.dart';
import 'package:no_one_academy_task2/services/product_services.dart';

class ProductRepository {
  final ProductService productService = ProductService();

  Future<List<Product>> getProducts() async {
    return await productService.getProducts();
  }
}
