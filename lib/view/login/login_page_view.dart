import 'package:get/get.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/view_models/controller/login/login_controller.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  _LoginPageViewState createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
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
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 1.0,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.08,
                      decoration: const BoxDecoration(),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.8,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.3,
                      decoration: const BoxDecoration(),
                      child: Image.asset(
                        'assets/images/login_light.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(
                          30.0, 20.0, 30.0, 0.0),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 1.0,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.45,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Login',
                                style: FlutterFlowTheme
                                    .of(context)
                                    .titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: loginController.email.value,
                                  obscureText: false,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.phone,
                                      color: FlutterFlowTheme
                                          .of(context)
                                          .iconColour,
                                    ),
                                    labelText: 'Enter Mobile Number',
                                    labelStyle:
                                    FlutterFlowTheme
                                        .of(context)
                                        .bodySmall,
                                    hintText: 'Please Enter Mobile Number',
                                    hintStyle: FlutterFlowTheme
                                        .of(context)
                                        .bodySmall,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme
                                            .of(context)
                                            .borderColour,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                        FlutterFlowTheme
                                            .of(context)
                                            .focuscolour,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme
                                            .of(context)
                                            .error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme
                                            .of(context)
                                            .error,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  style: FlutterFlowTheme
                                      .of(context)
                                      .bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Obx(() {
                                  return TextFormField(
                                    controller: loginController.password.value,
                                    obscureText:
                                    !loginController.passwordVisibility.value,
                                    obscuringCharacter: '*',
                                    decoration: InputDecoration(
                                      labelText: 'Enter Password',
                                      labelStyle:
                                      FlutterFlowTheme
                                          .of(context)
                                          .bodySmall,
                                      hintText: 'Please Enter Password',
                                      hintStyle:
                                      FlutterFlowTheme
                                          .of(context)
                                          .bodySmall,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .borderColour,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            15.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .focuscolour,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .error,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme
                                              .of(context)
                                              .error,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          loginController.passwordVisibility
                                              .value =
                                          !loginController
                                              .passwordVisibility.value;
                                        },
                                        focusNode: FocusNode(
                                            skipTraversal: true),
                                        child: Icon(
                                          loginController.passwordVisibility
                                              .value
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined,
                                          color:
                                          FlutterFlowTheme
                                              .of(context)
                                              .iconColour,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme
                                        .of(context)
                                        .bodyMedium,
                                    keyboardType: TextInputType.visiblePassword,
                                  );
                                }),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 1.0,
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.1,
                                decoration: const BoxDecoration(),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    loginController.submit();
                                    print('Button pressed ...');
                                  },
                                  text: 'LOG IN HERE ',
                                  options: FFButtonOptions(
                                    width: 300.0,
                                    height: 60.0,
                                    padding: const EdgeInsetsDirectional
                                        .fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional
                                        .fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme
                                        .of(context)
                                        .buttonColour,
                                    textStyle:
                                    FlutterFlowTheme
                                        .of(context)
                                        .labelSmall,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 15.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  return Visibility(
                      visible: loginController.loading.value,
                      child: Container(
                          height: Get.height,
                          width: Get.width,
                          alignment: Alignment.center,
                          color: Colors.white60,

                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme
                                .of(context)
                                .iconColour,
                          )));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
