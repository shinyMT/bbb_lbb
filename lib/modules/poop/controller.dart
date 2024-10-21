import 'package:bbb_lbb/data/provider/poop_provider.dart';
import 'package:get/get.dart';

class PoopController extends GetxController with StateMixin {
  final PoopProvider _poopProvider = PoopProvider();

  // 查询用户的指定年月BB记录
  Future<void> queryPoopList() async {
    change(null, status: RxStatus.loading());
    var result = await _poopProvider.queryPoopList();
    if (result.body?.code == 0) {
      change(result.body?.result, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?.message));
    }
  }

  // 添加BB记录
  Future<void> addPoop(String poopTime) async {
    var result = await _poopProvider.addPoop(poopTime);
    if (result.body?.code == 0) {
      change(result.body?.result, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?.message));
    }
  }
}
