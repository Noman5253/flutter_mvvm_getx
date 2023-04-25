import 'package:flutter/material.dart';
import 'package:mvvm_sample/utils/bindings/user_binding.dart';
import 'package:mvvm_sample/utils/dialog_service/dialog_service.dart';
import 'package:mvvm_sample/modules/users/users_view.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVVM DEMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/users', page: () => UserView(), binding: UsersBinding())
      ],
      initialRoute: '/users',
      navigatorKey: locator<NavigationService>().navigatoryKey,
      //navigatorKey: ,
      //home: UserView()
    );
  }
}
