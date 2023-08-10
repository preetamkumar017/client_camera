import 'dart:developer';
import 'package:get/get.dart';
import 'package:ghar_darshan/data/response/status.dart';
import 'package:ghar_darshan/flutter_flow/flutter_flow_widgets.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';
import 'package:ghar_darshan/res/components/general_exception.dart';
import 'package:ghar_darshan/res/components/internet_exceptions_widget.dart';
import 'package:ghar_darshan/res/components/no_data_found_exception.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/view_models/controller/home_page_controller/manual_uploaded_controller.dart';
import 'package:ghar_darshan/view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'package:intl/intl.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManualUploadedImageList extends StatefulWidget {
  const ManualUploadedImageList({Key? key}) : super(key: key);

  @override
  _ManualUploadedImageListState createState() =>
      _ManualUploadedImageListState();
}

class _ManualUploadedImageListState extends State<ManualUploadedImageList> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final clientImageViewModel = Get.put(ManualUploadedController());

  @override
  void initState() {
    clientImageViewModel.getData(context);
    clientImageViewModel.addValue();
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // log(mainController.clientName.value);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hey, ',
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                            TextSpan(
                              text: clientImageViewModel.clientName.value,
                              style: FlutterFlowTheme.of(context).labelMedium,
                            )
                          ],
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      );
                    }),
                    FFButtonWidget(
                        text: "Logout",
                        onPressed: () {
                          UserPreference sp = UserPreference();
                          sp.removeUser().then((value) {
                            Get.offAllNamed(RouteName.loginView);
                          });
                        },
                        options: FFButtonOptions(
                          color: FlutterFlowTheme.of(context).buttonColour,
                        ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return Text(
                        clientImageViewModel.siteName.value,
                        style: FlutterFlowTheme.of(context).labelLarge,
                      );
                    }),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).borderColour,
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2030));

                          if (pickedDate != null) {
                            // log(pickedDate.toString());
                            clientImageViewModel.date.value = DateFormat('yyyy-MM-dd').format(pickedDate);
                            clientImageViewModel.getData(context);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendarDay,
                              color: FlutterFlowTheme.of(context).iconColour,
                              size: 18.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Obx(() {
                                return Text(
                                  DateFormat('dd-MMM-yyyy').format(DateTime.parse(clientImageViewModel.date.value)),
                                  style:FlutterFlowTheme.of(context).bodyMedium,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Obx(() {
                switch (clientImageViewModel.rxRequestStatus.value) {
                  case Status.LOADING:
                    return const Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    if (clientImageViewModel.error.value == 'No internet') {
                      return InterNetExceptionWidget(
                        onPress: () {
                          // homeController.refreshApi();

                          clientImageViewModel.getData(context);
                        },
                      );
                    } else {
                      return GeneralExceptionWidget(onPress: () {
                        clientImageViewModel.getData(context);
                      });
                    }
                  case Status.COMPLETED:
                    log(clientImageViewModel.imageDetails.value
                        .toJson()
                        .toString());
                    // log(mainController.pp.value.toString());
                    if(clientImageViewModel.imageDetails.value.result != null)
                      {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 15, 20, 20),
                            child: ListView.builder(
                                shrinkWrap: false,
                                itemCount: clientImageViewModel.imageDetails.value.result!.length,
                                itemBuilder:(context, idx)   {

                                  // log(clientImageViewModel.imageDetails.value.result!.length.toString() ?? "");
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: Get.width,
                                          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            // color: Colors.brown[400],
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: Text("Remark:- ${clientImageViewModel.imageDetails.value.result![idx].remark ?? "No Remark Available"}",
                                            style: const TextStyle(
                                              // color: Colors.white,
                                                fontSize: 15
                                            ),
                                          )),
                                      GridView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: clientImageViewModel.imageDetails.value.result![idx].imageList!.length,
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 0.1,
                                          childAspectRatio: 1.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          // log(clientImageViewModel.imageDetails.value.result![idx].imageNames!.length.toString() ?? "");
                                          String data =  clientImageViewModel.imageDetails.value.result![idx].imageList![index];
                                          // log(AppUrl.subMainUrl+"/assets/site_images/manual_upload/"+ data.imageName.toString());
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  clientImageViewModel.imageUrl.value = "${AppUrl.subMainUrl}/assets/site_images/manual_upload/${data}";
                                                  log("message");
                                                  Get.toNamed(RouteName.manualUploadedImageView);
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width *
                                                      0.8,
                                                  height:
                                                  MediaQuery.of(context).size.height *
                                                      0.17,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(15.0),
                                                    border: Border.all(
                                                      width: 3.0,
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(13.0),
                                                    child: Image.network(
                                                      "${AppUrl.subMainUrl}/assets/site_images/manual_upload/$data",
                                                      width: MediaQuery.of(context)
                                                          .size
                                                          .width * 0.7,
                                                      height: MediaQuery.of(context)
                                                          .size
                                                          .height * 0.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Center(
                                              //   child: Text(
                                              //     data ?? "",
                                              //     style: FlutterFlowTheme.of(context)
                                              //         .labelMedium,
                                              //     overflow: TextOverflow.ellipsis,
                                              //   ),
                                              // ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                }
                            ),
                          ),
                        );
                      }else
                        {
                         return NoDataFoundExceptionWidget(onPress: () {
                            clientImageViewModel.getData(context);
                          });
                        }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
