import 'package:injectable/injectable.dart';
import '../../domain/dataSource/ptoduct_online_data_source.dart';
import '../../domain/modelDto/ProductDto.dart';
import '../../domain/repository/product_repo.dart';
@Injectable( as:ProductRepo )
class ProductRepoImp implements ProductRepo{
  ProductOnlineDataSource ptoductOnlineDataSource;
  ProductRepoImp(this.ptoductOnlineDataSource);

  @override
  Future<ProductDto?> getProducts() {
     return ptoductOnlineDataSource.getProducts();
  }
}
