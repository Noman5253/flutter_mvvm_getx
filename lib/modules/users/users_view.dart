import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_sample/modules/users/users_viewmodel.dart';

// ignore: use_key_in_widget_constructors
class UserView extends StatelessWidget {
  //final c = Get.put(UsersVM());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(body: GetBuilder<UsersVM>(
        builder: (controller) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: controller.usersList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.onUserTap(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.all(16),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Text(controller.usersList[index].email!),
                        Text(controller.usersList[index].firstName!),
                        Text(controller.usersList[index].lastName!),
                        const SizedBox(
                          width: 20,
                        )
                      ]),
                    ),
                  );
                },
              ))
            ],
          );
        },
      ))),
    );
  }
}
