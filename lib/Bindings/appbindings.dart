import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:softloanapp/Controller/navigationcontroller.dart';
import 'package:softloanapp/Widget/bottomnavbar.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
  }
}
