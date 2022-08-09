import 'package:demo_di/data/data_source/remote/abstract/user_cloud_datasource.dart';
import 'package:demo_di/data/network/http_network.dart';

class UserCloudDataDataSourceImpl implements UserCloudDataSource {
  final HttpNetwork _httpNetwork;

  UserCloudDataDataSourceImpl(this._httpNetwork);

  @override
  Future<String> getUsername() {
    return _httpNetwork.getUsername();
  }
}
