import 'package:bbb_lbb/modules/poop/controller.dart';
import 'package:bbb_lbb/modules/poop/poop_statistics.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class PoopPage extends GetView<PoopController> {
  List<DateTime> _dates = [];
  DateTime _selectedDate = DateTime.now();
  final poopController = Get.put(PoopController());

  PoopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('便便记录'),
        actions: _buildActions(),
        // bottom: TabBar(
        //   poopController: _tabController,
        //   tabs: _buildTabList(),
        // ),
      ),
      body: poopController.obx(
        (state) {
          if (state is List) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: _buildContent(state),
            );
          } else {
            poopController.queryPoopList(
                _selectedDate.year, _selectedDate.month);
            return Container();
          }
        },
        onEmpty: _buildContent([]),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (msg) {
          showToast("$msg");
          return _buildContent([]);
        },
      ),
    );
  }

  /// 构建appBar的操作按钮
  List<Widget> _buildActions() {
    return [
      PopupMenuButton(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 0,
              child: const Text('查看汇总'),
              onTap: () {
                Get.to(PoopStatisticsPage());
              },
            ),
          ];
        },
        // onSelected: (val) {
        //   if (val == 0) {
        //     _showAddCategoryDialog();
        //   } else {
        //     Get.to(() => const CookAddPage());
        //   }
        // },
      )
    ];
  }

  /// 构建body内容
  Widget _buildContent(List<dynamic> list) {
    //  获取list中所有的poopTime
    var dateList = list.map((e) => DateTime.parse(e["poopTime"]!)).toList();
    _dates = dateList;
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        calendarType: CalendarDatePicker2Type.multi,
        selectedDayTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      value: _dates,
      onValueChanged: (date) {
        // 过滤出date中不包含_date中的数据
        var matchedList = date.where((item) => !_dates.contains(item)).toList();
        if (matchedList.isNotEmpty) {
          _selectedDate = matchedList[0];
        }
        _dates = date;
        if (_dates.contains(_selectedDate)) {
          // 添加
          poopController.addPoop(_selectedDate);
          // 刷新数据
          poopController.queryPoopList(_selectedDate.year, _selectedDate.month);
        } else {
          // 取消
          Get.defaultDialog(
            title: '警告',
            middleText: '是否确认取消${_selectedDate.toString().split(' ')[0]}的记录',
            onConfirm: () {
              // 从list中筛选poopTime为_selectedDate的数据
              var matchedList = list
                  .where((e) =>
                      DateTime.parse(e["poopTime"]!).toString().split(' ')[0] ==
                      _selectedDate.toString().split(' ')[0])
                  .toList();
              if (matchedList.isNotEmpty) {
                poopController.deletePoop(matchedList[0]["id"]);
                Get.back();
              }
            },
            onCancel: () {
              // 关闭弹窗
              Get.back();
            },
          );
        }
        print('$_dates, $_selectedDate');
      },
    );
  }
}
