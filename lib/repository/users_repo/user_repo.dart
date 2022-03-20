import 'package:mvvm_sample/models/users.dart';

abstract class UserRepo {
  Future<Users?> getUsersFromRepo();
}
