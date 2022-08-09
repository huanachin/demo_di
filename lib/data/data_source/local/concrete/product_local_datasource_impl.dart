import 'package:demo_di/data/data_source/local/abstract/product_local_datasource.dart';
import 'package:demo_di/data/database/database.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Database _database;

  ProductLocalDataSourceImpl(this._database);

  @override
  Future<String> getProductName() {
    return _database.getProductName();
  }
}
