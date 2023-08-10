import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ghar_darshan/flutter_flow/flutter_flow_widgets.dart';
import 'package:ghar_darshan/res/app_url/app_url.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/view_models/controller/home_page_controller/cctv_controller.dart';
import 'package:ghar_darshan/view_models/controller/login/login_controller.dart';
import 'package:ghar_darshan/view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'package:ghar_darshan/view_models/services/common_methods.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CctvPageView extends StatefulWidget {
  const CctvPageView({Key? key}) : super(key: key);

  @override
  _CctvPageViewState createState() => _CctvPageViewState();
}

class _CctvPageViewState extends State<CctvPageView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final cctvController = Get.put(CCTVController());

  @override
  void initState() {
    cctvController.addValue();
    cctvController.getData(context);

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
                              text: cctvController.clientName.value,
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
                        cctvController.siteName.value,
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
                            cctvController.date.value =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            cctvController.pp.value = [];
                            cctvController.getData(context);
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
                                  DateFormat('dd-MMM-yyyy').format(
                                      DateTime.parse(
                                          cctvController.date.value)),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                if (cctvController.pp.value.isEmpty) {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        cctvController.pp.value = [];
                        cctvController.getData(context);
                      },
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        enabled: true,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30.0, 0.0, 30.0, 0.0),
                          child: GridView.builder(
                            itemCount: 10,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 0.0,
                              childAspectRatio: 1.0,
                            ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.15,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: 10,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  // log(mainController.pp.value.toString());
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          30.0, 0.0, 30.0, 0.0),
                      child: RefreshIndicator(
                        onRefresh: () async {
                          cctvController.pp.value = [];
                          cctvController.getData(context);
                        },
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 0.0,
                            childAspectRatio: 1.0,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cctvController.pp.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (cctvController.pp[index] == '.' ||
                                cctvController.pp[index] == '..') {
                              return const SizedBox.shrink();
                            } else {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cctvController.imageName.value =
                                          cctvController.pp[index];
                                      log("message");
                                      Get.toNamed(RouteName.imageView);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .borderColour,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(19.0),
                                        child: Image.network(
                                          '${AppUrl.imageUrl}${cctvController.folderName}/${cctvController.dvrIp}/${cctvController.date}/${cctvController.pp[index]}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    getTimeFromFileName(
                                        cctvController.pp[index]),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  )
                                ],
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
