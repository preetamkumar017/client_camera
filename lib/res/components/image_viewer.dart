import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';
import 'package:ghar_darshan/view_models/controller/home_page_controller/cctv_controller.dart';
import 'package:photo_view/photo_view.dart';

class MyImageView extends StatefulWidget {
  const MyImageView({super.key});
  @override
  State<MyImageView> createState() => _MyImageViewState();
}
class _MyImageViewState extends State<MyImageView> {
  final mainController = Get.put(CCTVController());
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
         imageProvider:NetworkImage("${AppUrl.imageUrl}${mainController.folderName}/${mainController.dvrIp}/${mainController.date}/${mainController.imageName.value}")
          ),
      ),
    );
  }
}

