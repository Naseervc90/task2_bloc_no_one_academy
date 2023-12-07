import 'package:flutter/material.dart';
import 'package:no_one_academy_task2/model/product.dart';
import 'package:no_one_academy_task2/utils/responsive.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5.0,
        shadowColor: Colors.grey,
        child: Responsive(
          mobile: _buildProductItem(context, 80),
          tablet: _buildProductItem(context, 120),
        ));
  }

  Widget _buildProductItem(BuildContext context, double cardHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: cardHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product.image, scale: 0.7))),
          ),
          SizedBox(height: 4),
          Text('\$${product.price}', style: TextStyle(fontSize: 14)),
          SizedBox(height: 4),
          Text(product.category, style: TextStyle(fontSize: 14)),
          SizedBox(height: 4),
          Flexible(
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(product.rating.rate.toString(),
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  width: 8.0,
                ),
                Text(product.rating.count.toString(),
                    style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
