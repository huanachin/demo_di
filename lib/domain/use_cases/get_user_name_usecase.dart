import 'package:demo_di/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserNameUseCase {
  final UserRepository _userRepository;

  GetUserNameUseCase(this._userRepository);

  Future<String> getUserName() {
    return _userRepository.getName();
  }
}
