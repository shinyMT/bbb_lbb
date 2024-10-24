import 'package:bbb_lbb/data/provider/poop_provider.dart';
import 'package:get/get.dart';

enum PoopState { delSuccess }

class PoopController extends GetxController with StateMixin {
  final PoopProvider _poopProvider = PoopProvider();

  // 查询用户的指定年月BB记录
  Future<void> queryPoopList(int year, int month) async {
    change(null, status: RxStatus.loading());
    var result = await _poopProvider.queryPoopList(year, month);
    if (result.body?["code"] == 0) {
      change(result.body?["result"], status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?["message"]));
    }
  }

  // 添加BB记录
  Future<void> addPoop(DateTime poopTime) async {
    change(null, status: RxStatus.loading());
    var result =
        await _poopProvider.addPoop(poopTime, poopTime.year, poopTime.month);
    if (result.body?["code"] == 0) {
      change(result.body?["result"], status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?["message"]));
    }
  }

  // 删除BB记录
  Future<void> deletePoop(int id) async {
    change(null, status: RxStatus.loading());
    var result = await _poopProvider.deletePoop(id);
    if (result.body?["code"] == 0) {
      change(result.body?["result"], status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?["message"]));
    }
  }

  // 统计用户指定年份的BB数据
  Future<void> statisticsPoop(int year) async {
    change(null, status: RxStatus.loading());
    var result = await _poopProvider.queryPoopStatisticsByYear(year);
    if (result.body?["code"] == 0) {
      change(result.body?["result"], status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?["message"]));
    }
  }

  @override
  void onInit() {
    super.onInit();
    // 获取当前年月
    var now = DateTime.now();
    queryPoopList(now.year, now.month);
  }
}
