import 'package:bbb_lbb/data/api/api.dart';
import 'package:bbb_lbb/data/services/http_util.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PoopProvider extends BaseProvider {
  Future<Response<dynamic>> queryPoopList() => get(queryBbList);
  Future<Response<dynamic>> addPoop(poopTime) => post(
        insertPoop,
        {
          query: {"userId": 1, "poopTime": poopTime}
        },
      );
}
