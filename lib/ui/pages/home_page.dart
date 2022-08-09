import 'package:demo_di/di/injection.dart';
import 'package:demo_di/domain/use_cases/get_product_name_usecase.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: FutureBuilder<String>(
          future: getIt<GetProductNameUseCase>().getProductName(),
          builder: (context, snapshot) {
            return Center(
              child: Text(
                snapshot.data ?? "",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 32,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
