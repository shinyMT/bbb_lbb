import 'package:bbb_lbb/data/provider/user_provider.dart';
import 'package:bbb_lbb/pages/tabs.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController with StateMixin {
  final UserProvider _userProvider = UserProvider();

  // 查询所有用户信息
  // Future<void> queryAllUser() async {
  //   change(null, status: RxStatus.loading());
  //   var result = await _userProvider.queryAllUser();
  //   if (result.body?.code == 0) {
  //     change(result.body?.result, status: RxStatus.success());
  //   } else {
  //     change(null, status: RxStatus.error(result.body?.message));
  //   }
  // }

  // 查询单个用户信息
  Future<void> queryUserById(int id) async {
    // 设置状态为加载
    change(null, status: RxStatus.loading());
    var result = await _userProvider.queryUserById(id);
    if (result.body!['code'] > 0) {
      // 设置状态为成功
      change(result.body?['result'], status: RxStatus.success());
    } else {
      // 设置状态为失败
      change(null, status: RxStatus.error(result.body?['message']));
    }
  }

  // 登录验证
  Future<void> login(String account, String password) async {
    change(null, status: RxStatus.loading());
    var result = await _userProvider.login(account, password);
    if (result.body!['code'] >= 0) {
      change(result.body?['result'], status: RxStatus.success());
      // 记录用户信息
      GetStorage storage = GetStorage();
      storage.write('user', result.body?['result']);
      Get.to(() => const Tabs());
    } else {
      change(null, status: RxStatus.error(result.body?['message']));
    }
  }

  @override
  void onInit() {
    super.onInit();
    // 初始时就加载
    change(null, status: RxStatus.empty());
  }
}
