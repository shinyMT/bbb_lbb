import 'package:bbb_lbb/data/provider/poop_provider.dart';
import 'package:bbb_lbb/modules/poop/controller.dart';
import 'package:get/get.dart';

class PoopBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoopController>(() => PoopController());
    Get.lazyPut<PoopProvider>(() => PoopProvider());
  }
}
