import 'package:demo_di/data/data_source/local/abstract/product_local_datasource.dart';
import 'package:demo_di/data/data_source/preferences/abstract/local_preferences.dart';
import 'package:demo_di/data/data_source/remote/abstract/product_cloud_datasource.dart';
import 'package:demo_di/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository{

  final ProductLocalDataSource _productLocalDataSource;
  final ProductCloudDataSource _productCloudDataSource;
  final LocalPreferences _localPreferences;

  ProductRepositoryImpl(this._productLocalDataSource, this._productCloudDataSource, this._localPreferences);

  @override
  Future<String> getProductName() {
    //TODO NETWORK LOGIC
    return _productCloudDataSource.getProductName();
  }

}