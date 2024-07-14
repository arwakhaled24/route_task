
import '../modelDto/ProductDto.dart';

abstract class ProductRepo {
  Future<ProductDto?> getProducts();
}