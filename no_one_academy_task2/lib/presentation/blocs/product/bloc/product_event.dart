part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class FetchProducts extends ProductEvent {
  @override
  List<Object> get props => [];
}
