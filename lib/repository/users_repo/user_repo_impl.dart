import 'package:flutter/foundation.dart';
import 'package:mvvm_sample/data/remote/api_service.dart';
import 'package:mvvm_sample/models/users.dart';
import 'package:mvvm_sample/repository/users_repo/user_repo.dart';

class UserRepoImp extends UserRepo {
  ApiService apiService = ApiService();

  @override
  Future<Users?> getUsersFromRepo() async {
    dynamic response = await apiService.getUsers();
    debugPrint("USERS REPO $response");
    final jsonData = Users.fromJson(response);
    return jsonData;
  }
}
