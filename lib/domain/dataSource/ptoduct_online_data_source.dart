
import '../modelDto/ProductDto.dart';

abstract class ProductOnlineDataSource {
  Future<ProductDto?> getProducts();
}