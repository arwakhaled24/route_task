
import 'package:injectable/injectable.dart';
import '../modelDto/ProductDto.dart';
import '../repository/product_repo.dart';
@injectable
class ProductUsecase{

  ProductRepo productRepository;
  ProductUsecase(this.productRepository);

  Future<ProductDto?> getProducts() async {
    return   productRepository.getProducts();

  }

}
