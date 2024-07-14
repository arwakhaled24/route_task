// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_manager.dart' as _i3;
import '../../data/dataScource/product_online_data_scource_imp.dart' as _i5;
import '../../data/repository/product_repo.dart' as _i7;
import '../../domain/dataSource/ptoduct_online_data_source.dart' as _i4;
import '../../domain/repository/product_repo.dart' as _i6;
import '../../domain/usecase/product_usecase.dart' as _i8;
import '../../ui/screens/product/product_viewModel.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductOnlineDataSource>(
        () => _i5.ProuductOnlineDataScourceImp(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepo>(
        () => _i7.ProductRepoImp(gh<_i4.ProductOnlineDataSource>()));
    gh.factory<_i8.ProductUsecase>(
        () => _i8.ProductUsecase(gh<_i6.ProductRepo>()));
    gh.factory<_i9.ProductViewModel>(
        () => _i9.ProductViewModel(gh<_i8.ProductUsecase>()));
    return this;
  }
}
