import 'package:get/get.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/view_models/controller/home_page_controller/manual_uploaded_controller.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class SelectSourceView extends StatefulWidget {
  const SelectSourceView({Key? key}) : super(key: key);

  @override
  _SelectSourceViewState createState() => _SelectSourceViewState();
}

class _SelectSourceViewState extends State<SelectSourceView> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final clientImageViewModel = Get.put(ManualUploadedController());

  @override
  void initState() {
    super.initState();
    clientImageViewModel.addValue();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme
            .of(context)
            .primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.05,
                  decoration: const BoxDecoration(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: FlutterFlowTheme
                                  .of(context)
                                  .iconColour,
                              size: 20,
                            ),
                            Obx(() {
                              return Text(
                                clientImageViewModel.clientName.value,
                                style: FlutterFlowTheme
                                    .of(context)
                                    .bodySmall,
                              );
                            }),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.manualUploadedImage);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.32,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: FlutterFlowTheme
                                    .of(context)
                                    .borderColour,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(21),
                            border: Border.all(
                              color: FlutterFlowTheme
                                  .of(context)
                                  .borderColour,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Image.asset(
                                    'assets/images/manual_upload.png',
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Text(
                                  'Manual Uploaded  Imaged',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.dashboardView);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.8,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.32,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme
                                .of(context)
                                .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: FlutterFlowTheme
                                    .of(context)
                                    .borderColour,
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(21),
                            border: Border.all(
                              color: FlutterFlowTheme
                                  .of(context)
                                  .borderColour,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Image.asset(
                                    'assets/images/cctv_upload.png',
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    height:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.2,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: Text(
                                  'CCTCV Image upload',
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
