import 'package:demo_di/data/data_source/local/abstract/user_local_datasource.dart';
import 'package:demo_di/data/database/database.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserLocalDataSource)
class UserLocalDataDataSourceImpl implements UserLocalDataSource {
  final Database _database;

  UserLocalDataDataSourceImpl(this._database);

  @override
  Future<String> getUsername() {
    return _database.getUsername();
  }
}
