import 'package:get/get.dart';
import 'package:mvvm_sample/view_model/users_viewmodel/users_viewmodel.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UsersVM());
  }
}
