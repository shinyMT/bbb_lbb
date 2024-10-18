import 'package:bbb_lbb/data/api/user/user_provider.dart';
import 'package:get/get.dart';

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
    change(null, status: RxStatus.loading());
    var result = await _userProvider.queryUserById(id);
    if (result.body?.code == 0) {
      change(result.body?.result, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(result.body?.message));
    }
  }

  @override
  void onInit() {
    super.onInit();
    // 初始时就加载
  }
}
