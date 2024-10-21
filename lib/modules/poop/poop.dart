import 'package:bbb_lbb/modules/poop/poop_statistics.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoopPage extends StatefulWidget {
  const PoopPage({super.key});

  @override
  State<PoopPage> createState() => _PoopPageState();
}

class _PoopPageState extends State<PoopPage> {
  List<DateTime> _dates = [];
  late DateTime _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('便便记录'),
        actions: _buildActions(),
        // bottom: TabBar(
        //   controller: _tabController,
        //   tabs: _buildTabList(),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: _buildContent(),
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
                Get.to(const PoopStatisticsPage());
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
  Widget _buildContent() {
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
        } else {
          // 取消
          _showDialog(
              '警告', '是否确认取消${_selectedDate.toString().split(' ')[0]}的记录');
        }
        print('$_dates, $_selectedDate');
      },
    );
  }

  Future<void> _showDialog(String titleName, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleName),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('确认'),
              onPressed: () {
                // 调用接口取消
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "取消",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        );
      },
    );
  }
}
