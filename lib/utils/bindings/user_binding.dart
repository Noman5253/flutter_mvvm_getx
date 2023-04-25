import 'package:get/get.dart';
import 'package:mvvm_sample/modules/users/users_viewmodel.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UsersVM());
  }
}
