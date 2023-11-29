import 'package:flutter/material.dart';
import 'package:no_one_academy_task2/model/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.image,
              height: 60, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('\$${product.price}', style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text(product.category, style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(product.rating.toString(),
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
