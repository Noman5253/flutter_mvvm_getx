import 'package:mvvm_sample/modules/users/users_model.dart';

abstract class UserRepo {
  Future<Users?> getUsersFromRepo();
}
