

import 'package:baseproject_rendering/Screens/Illustration/splash_screen.dart';
import 'package:baseproject_rendering/Screens/List/form_details_view.dart';
import 'package:baseproject_rendering/Screens/List/listscreen.dart';
import 'package:baseproject_rendering/Screens/Login/login_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => const LoginView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    // GetPage(
    //   name: Routes.dashboardView,
    //   page: () =>  HomeScreen(),
    //   transition: Transition.noTransition,
    // ),
    GetPage(
      name: Routes.formListView,
      page: () => FormsListView(),
      transition: Transition.noTransition,
    ),

    GetPage(
      name: Routes.formDetailsView,
      page: () =>  FormDetailsView(title: ''),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
