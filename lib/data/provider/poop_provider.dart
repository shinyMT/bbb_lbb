import 'package:bbb_lbb/data/api/api.dart';
import 'package:bbb_lbb/data/services/http_util.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';

class PoopProvider extends BaseProvider {
  GetStorage storage = GetStorage();

  // 根据年月查询BB记录
  Future<Response<dynamic>> queryPoopList(int year, int month) => get(
        apiQueryBbList,
        headers: {"userId": storage.read("user")["id"].toString()},
        query: {"year": year.toString(), "month": month.toString()},
      );

  // 添加BB记录
  Future<Response<dynamic>> addPoop(DateTime poopTime, int year, int month) =>
      post(
        apiInsertPoop,
        {
          "poopTime": poopTime.toString(),
          "year": year.toString(),
          "month": month.toString()
        },
        headers: {"userId": storage.read("user")["id"].toString()},
      );

  // 删除BB记录
  Future<Response<dynamic>> deletePoop(int id) => get(
        apiDeletePoop,
        query: {"id": id.toString()},
        headers: {"userId": storage.read("user")["id"].toString()},
      );

  // 查询用户指定年份的BB记录
  Future<Response<dynamic>> queryPoopStatisticsByYear(int year) => get(
        apiStatistics,
        headers: {"userId": storage.read("user")["id"].toString()},
        query: {"year": year.toString()},
      );
}
