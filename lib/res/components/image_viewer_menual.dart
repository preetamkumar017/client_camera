import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';
import 'package:ghar_darshan/view_models/controller/home_page_controller/cctv_controller.dart';
import 'package:ghar_darshan/view_models/controller/home_page_controller/manual_uploaded_controller.dart';
import 'package:photo_view/photo_view.dart';

class MyImageViewManual extends StatefulWidget {
  const MyImageViewManual({super.key});
  @override
  State<MyImageViewManual> createState() => _MyImageViewManualState();
}
class _MyImageViewManualState extends State<MyImageViewManual> {
  final mainController = Get.put(ManualUploadedController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  PhotoView(
         imageProvider:NetworkImage("${mainController.imageUrl}")
          ),
      ),
    );
  }
}

