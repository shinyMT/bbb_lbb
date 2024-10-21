import 'package:bbb_lbb/data/provider/user_provider.dart';
import 'package:bbb_lbb/modules/user/controller.dart';
import 'package:get/get.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<UserProvider>(() => UserProvider());
  }
}
