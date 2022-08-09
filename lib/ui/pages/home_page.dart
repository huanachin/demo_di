import 'package:demo_di/data/data_source/local/abstract/product_local_datasource.dart';
import 'package:demo_di/data/data_source/local/concrete/product_local_datasource_impl.dart';
import 'package:demo_di/data/data_source/preferences/abstract/local_preferences.dart';
import 'package:demo_di/data/data_source/preferences/concrete/preferences_impl.dart';
import 'package:demo_di/data/data_source/remote/abstract/product_cloud_datasource.dart';
import 'package:demo_di/data/data_source/remote/concrete/product_cloud_datasource_impl.dart';
import 'package:demo_di/data/database/database.dart';
import 'package:demo_di/data/network/http_network.dart';
import 'package:demo_di/data/repositories/product_repository_impl.dart';
import 'package:demo_di/domain/repositories/product_repository.dart';
import 'package:demo_di/domain/use_cases/get_product_name_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<String> getProductName() async {
    Database database = Database(); // MUST BE SINGLETON
    HttpNetwork httpNetwork = HttpNetwork(); // MUST BE SINGLETON
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance(); // MUST BE SINGLETON
    LocalPreferences localPreferences = LocalPreferencesImpl(sharedPreferences); // MUST BE SINGLETON
    ProductCloudDataSource productCloudDataSource = ProductCloudDataSourceImpl(httpNetwork);
    ProductLocalDataSource productLocalDataSource = ProductLocalDataSourceImpl(database);
    ProductRepository productRepository = ProductRepositoryImpl(productLocalDataSource, productCloudDataSource, localPreferences);
    GetProductNameUseCase getProductNameUseCase = GetProductNameUseCase(productRepository);
    return getProductNameUseCase.getProductName();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: FutureBuilder<String>(
          future: getProductName(),
          builder: (context, snapshot) {
            return Text(snapshot.data ?? "");
          },
        ),
      ),
    );
  }
}
