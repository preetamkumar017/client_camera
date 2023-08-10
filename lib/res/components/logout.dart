import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/view_models/services/box_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: const Text('Logout'),
          onPressed: () {
            login.erase();
            Get.offAllNamed(RouteName.splashScreen);
          },
        ),
      ],
    );
  }
}
