import 'dart:developer';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:ftpconnect/ftpconnect.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ftpconnect/src/dto/ftp_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CCTVController extends GetxController {
  RxString clientName = "".obs;
  RxString folderName = "".obs;
  RxString dvrIp = "".obs;
  RxString siteName = "".obs;
  RxString date = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  RxString imageName = "".obs;
  RxList<String> pp = <String>[].obs;
  RxList<FTPEntry> aa = <FTPEntry>[].obs;

  Rx<FTPConnect> ftpConnect = FTPConnect('ukcdesigner.in',user: 'site_camera@ukcdesigner.in', pass: '(RaytO}cbnzX').obs;

  void addValue() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    folderName.value = sp.getString("folderName")!;
    dvrIp.value = sp.getString("dvr_ip")!;
    siteName.value = sp.getString("siteName")!;
    clientName.value = sp.getString("clientName")!;
  }

  Future<void> getData(BuildContext context) async {
    try {
      await ftpConnect.value.connect();
      bool exist = await ftpConnect.value.checkFolderExistence(
          "${folderName.value}/${dvrIp.value}/${date.value}");
      log(exist.toString());
      log("${folderName.value}/${dvrIp.value}/${date.value}");
      if (exist) {
        await ftpConnect.value.changeDirectory(
            "${folderName.value}/${dvrIp.value}/${date.value}");
        aa.value = await ftpConnect.value.listDirectoryContent();

// Sort the files in aa.value by modify time
//         aa.value.sort((a, b) => a.modifyTime!.compareTo(b.modifyTime!));
        aa.value.sort((a, b) => b.modifyTime!.compareTo(a.modifyTime!));

// Clear the pp list
        pp.clear();

// Iterate through each FTPEntry in aa.value
        for (FTPEntry entry in aa.value) {
          // Get the name of the entry
          String name = entry.name;

          // Add the name to the pp list
          pp.add(name);
        }

        pp.value = pp.value
            .where(
                (item) => item != '.' && item != '..' && item.endsWith('.jpg'))
            .toList();
        // print(pp.toString());
        // log("${folderName.value}/${dvrIp.value}/${date.value}");
      } else {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "Please change date for images!",
          title: "Images not available",
        );
      }
    } catch (e) {
      log(e.toString());
      CoolAlert.show(
        context: context,
        type: CoolAlertType.info,
        text: "Please change date for images!",
        title: "Images not available",
      );
    }

    ftpConnect.value.disconnect();
  }
}
