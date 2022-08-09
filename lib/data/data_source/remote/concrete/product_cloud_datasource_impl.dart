import 'package:demo_di/data/data_source/remote/abstract/product_cloud_datasource.dart';
import 'package:demo_di/data/network/http_network.dart';

class ProductCloudDataSourceImpl implements ProductCloudDataSource {
  final HttpNetwork _httpNetwork;

  ProductCloudDataSourceImpl(this._httpNetwork);

  @override
  Future<String> getProductName() {
    return _httpNetwork.getProductName();
  }
}
