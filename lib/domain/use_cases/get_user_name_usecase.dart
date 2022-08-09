import 'package:demo_di/domain/repositories/user_repository.dart';

class GetUserNameUseCase {
  final UserRepository _userRepository;

  GetUserNameUseCase(this._userRepository);

  Future<String> getUserName() {
    return _userRepository.getName();
  }
}
