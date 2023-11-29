import 'package:no_one_academy_task2/model/product.dart';
import 'package:no_one_academy_task2/utils/api_constants.dart';
import 'package:no_one_academy_task2/utils/network_helper.dart';

class ProductService {
  Future<List<Product>> getProducts() async {
    try {
      final response = await NetworkHelper.fetchData(
          ApiConstants.baseUrl + ApiConstants.productsUrl);
      print('Response: $response');

      return List<Product>.from(response.map((data) => Product.fromJson(data)));
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products');
    }
  }
}
