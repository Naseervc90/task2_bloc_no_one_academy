import 'package:no_one_academy_task2/domain/entities/product.dart';
import 'package:no_one_academy_task2/domain/repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts({required this.repository});

  Future<List<Product>> execute() async {
    return await repository.getProducts();
  }
}
