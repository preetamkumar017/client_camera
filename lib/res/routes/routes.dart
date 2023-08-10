import 'package:get/get.dart';
import 'package:ghar_darshan/res/components/image_viewer.dart';
import 'package:ghar_darshan/res/components/image_viewer_menual.dart';
import 'package:ghar_darshan/res/routes/routes_name.dart';
import 'package:ghar_darshan/view/images/cctv_page_view.dart';
import 'package:ghar_darshan/view/login/prelogin_page_view.dart';
import 'package:ghar_darshan/view/login/login_page_view.dart';
import 'package:ghar_darshan/view/select_source_view.dart';
import 'package:ghar_darshan/view/splash_screen.dart';
import 'package:ghar_darshan/view/images/menual_uploaded_image_list.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen() ,
      transitionDuration: const Duration(milliseconds: 1000),
      transition: Transition.fade ,
    ),
    GetPage(
      name: RouteName.loginView,
      page: () =>  const LoginPageView() ,
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: RouteName.preLoginView,
      page: () =>  const PreLoginView() ,
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: RouteName.dashboardView,
      page: () =>  const CctvPageView(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.imageView,
      page: () =>   const MyImageView(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.selectSource,
      page: () =>   const SelectSourceView(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.manualUploadedImage,
      page: () =>    const ManualUploadedImageList(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.manualUploadedImageView,
      page: () =>    const MyImageViewManual(),
      transitionDuration: const Duration(milliseconds: 500),
      transition: Transition.leftToRightWithFade,
    ),
  ];

}