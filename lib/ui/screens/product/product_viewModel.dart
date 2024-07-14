import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:route_task/domain/modelDto/ProductDto.dart';

import '../../../domain/usecase/product_usecase.dart';
@injectable
class ProductViewModel extends Cubit<ProductState> {

  late ProductUsecase productUsecase;

  ProductViewModel(this.productUsecase) : super(ProductInitial());

  void getProducts() async {
    try {
      emit(ProductInitial());
      var prouduct = await productUsecase.getProducts();
    if(prouduct != null){
        emit(ProductLoaded(products: prouduct));
      }
      else{
        emit(ProductError(error: 'check the internet conection'));
      }
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }
}

abstract class ProductState{}
 class ProductInitial extends ProductState{
 }
 class ProductLoaded extends ProductState{
     var products= ProductDto();
    ProductLoaded({required this.products});
 }
  class ProductError extends ProductState{
    var error;
    ProductError({required this.error});
  }