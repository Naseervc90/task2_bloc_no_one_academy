import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_one_academy_task2/blocs/product/product_bloc.dart';
import 'package:no_one_academy_task2/blocs/product/product_event.dart';
import 'package:no_one_academy_task2/blocs/product/product_state.dart';
import 'package:no_one_academy_task2/model/product.dart';
import 'package:no_one_academy_task2/ui/components/product_item.dart';

class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final ProductBloc _productBloc = ProductBloc();

  @override
  void initState() {
    super.initState();
    _productBloc.add(LoadProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return buildProductList(state.products);
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Something went wrong.'));
          }
        },
      ),
    );
  }

  Widget buildProductList(List<Product> products) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(product: products[index]);
      },
    );
  }

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }
}
