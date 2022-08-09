import 'package:demo_di/data/data_source/local/abstract/user_local_datasource.dart';
import 'package:demo_di/data/data_source/remote/abstract/user_cloud_datasource.dart';
import 'package:demo_di/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _userLocalDataSource;
  final UserCloudDataSource _userCloudDataSource;

  UserRepositoryImpl(
    this._userLocalDataSource,
    this._userCloudDataSource,
  );

  @override
  Future<String> getName() {
    //TODO NETWORK LOGIC
    return _userLocalDataSource.getUsername();
  }
}
