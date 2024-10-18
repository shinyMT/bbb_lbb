import 'package:bbb_lbb/data/api/api.dart';
import 'package:bbb_lbb/data/model/user.dart';
import 'package:bbb_lbb/data/services/http_util.dart';
import 'package:get/get.dart';

class UserProvider extends BaseProvider {
  // Future<Response<UserEntity>> queryAllUser() => get(listAllUser);

  Future<Response<UserEntity>> queryUserById(int id) =>
      get(getUserById, query: {"id": id});
}
