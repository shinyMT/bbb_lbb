// ignore: constant_identifier_names
const baseServerApi = "http://192.168.2.181:8080";

// =========================== 用户相关 ===========================
// 查询所有用户
var listAllUser = '$baseServerApi/user/listPage';
// 查看单个用户详情
var getUserById = '$baseServerApi/user/details';
// 登录
var apiLogin = '$baseServerApi/user/login';

// =========================== BB相关 ===========================
// 查询当前用户指定年月的BB记录
var queryBbList = '$baseServerApi/poop/listByYearMonth';
// 添加BB记录
var insertPoop = '$baseServerApi/poop/insert';
