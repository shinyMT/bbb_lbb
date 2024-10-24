import 'package:bbb_lbb/data/provider/poop_provider.dart';
import 'package:get/get.dart';

enum PoopState { delSuccess }

class StatisticsController extends GetxController with StateMixin {
  final PoopProvider _poopProvider = PoopProvider();

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
    statisticsPoop(now.year);
  }
}
