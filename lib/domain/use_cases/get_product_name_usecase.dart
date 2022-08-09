import 'package:demo_di/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductNameUseCase {
  final ProductRepository _productRepository;

  GetProductNameUseCase(this._productRepository);

  Future<String> getProductName() {
    return _productRepository.getProductName();
  }
}
