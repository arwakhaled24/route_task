
import 'package:injectable/injectable.dart';
import '../../domain/dataSource/ptoduct_online_data_source.dart';
import '../../domain/modelDto/ProductDto.dart';
import '../api/api_manager.dart';
@Injectable(as: ProductOnlineDataSource)
class ProuductOnlineDataScourceImp implements ProductOnlineDataSource{
  ApiManager apiManager;
  ProuductOnlineDataScourceImp(this.apiManager);
  @override
  Future<ProductDto?> getProducts()  async{
    var productRes= await apiManager.getProducts();
     return productRes?.toProductDto();

  }

 }