import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_one_academy_task2/blocs/product/product_bloc.dart';
import 'package:no_one_academy_task2/ui/pages/product_listing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Product Listing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: ProductListingPage(),
      ),
    );
  }
}
