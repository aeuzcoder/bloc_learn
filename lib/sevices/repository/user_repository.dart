import 'package:bloc_images/domain/models/user.dart';
import 'package:bloc_images/domain/repository/user_api_repository.dart';

class UserRepository {
  final UserApiRepository _userApiRepository = UserApiRepository();
  Future<List<User>> getUsers() => _userApiRepository.getData();
}
