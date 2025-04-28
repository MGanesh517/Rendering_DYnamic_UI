import 'package:baseproject_rendering/Screens/drawer_controller.dart';
import 'package:get/get.dart';
 
class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DrawerControllerX(), permanent: true);
    // Get.put<LoginController>(LoginController(), permanent: true);
    // Get.put<RetailersController>(RetailersController(), permanent: true);
    // Get.put<CartController>(CartController(), permanent: true);
  }
}
 