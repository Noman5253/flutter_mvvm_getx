import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mvvm_sample/data/remote/api_response.dart';
import 'package:mvvm_sample/models/users.dart';
import 'package:mvvm_sample/repository/users_repo/user_repo_impl.dart';

import '../../main.dart';
import '../../utils/dialog_service/dialog_service.dart';

class UsersVM extends GetxController {
  final userRepo = UserRepoImp();
  ApiResponse<Users> users = ApiResponse.loading();
  List<Datum> usersList = List.empty(growable: true);

  void onUsersLoaded(ApiResponse<Users> response) {
    usersList.addAll(response.data!.data!);
    update();
  }

  void onUserTap(index) {
    locator<NavigationService>().openDialog(usersList[index]);
  }

  void fetchUsers() async {
    //onUsersLoaded(ApiResponse.loading());
    userRepo
        .getUsersFromRepo()
        .then((value) => onUsersLoaded(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            onUsersLoaded(ApiResponse.error("Unable to Fetch")));
  }

  void init() async {
    fetchUsers();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}
