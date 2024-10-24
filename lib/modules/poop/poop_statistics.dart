import 'package:bbb_lbb/modules/poop/statistics_controller.dart';
import 'package:bbb_lbb/presentation/resources/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PoopStatisticsPage extends GetView<StatisticsController> {
  List<Color> gradientColors = [
    AppColors.contentColorCyan,
    AppColors.contentColorBlue,
  ];

  bool showAvg = false; // 是否展示平均值
  final statisticsController = Get.put(StatisticsController());

  PoopStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('便便统计'),
        ),
        body: statisticsController.obx(
          (state) => _buildContent(state),
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Text("暂无数据"),
          onError: (msg) => const Text("暂无统计结果"),
        ));
  }

  /// 构建主体内容
  Widget _buildContent(List<dynamic> list) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 9 / 16,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 50,
              bottom: 12,
            ),
            child: LineChart(
              mainData(list),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              // setState(() {
              //   showAvg = !showAvg;
              // });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 绘制网格
  FlGridData _getGridData() {
    return FlGridData(
      show: true, // 显示或隐藏背景网格数据
      drawHorizontalLine: false, // 显示或隐藏水平网格线
      drawVerticalLine: true, // 显示或隐藏垂直网格线
      horizontalInterval: 1, // grid 的 interval 空间，留 null 自动计算
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: AppColors.borderColor,
          strokeWidth: 2,
        );
      },
      getDrawingVerticalLine: (value) {
        return const FlLine(
          color: AppColors.borderColor,
          strokeWidth: 1,
        );
      },
    );
  }

  /// 生成标题部分
  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: bottomTitleWidgets,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTitlesWidget: leftTitleWidgets,
          reservedSize: 42,
        ),
      ),
    );
  }

  LineChartData mainData(List<dynamic> dataList) {
    if (dataList.isEmpty) {
      return LineChartData();
    }
    List<FlSpot> list = []; // 坐标列表
    for (var item in dataList) {
      list.add(FlSpot(item["month"].toDouble(), item["num"].toDouble()));
    }

    return LineChartData(
      backgroundColor: AppColors.pageBackground,
      gridData: _getGridData(),
      titlesData: _getTitlesData(),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 1,
      maxX: 12, // X轴最大值
      minY: 1,
      maxY: 35, // Y轴最大值
      lineBarsData: [
        LineChartBarData(
          spots: list,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  /// 构建X轴
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text = Text('${(value.toInt()).toString()}月', style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = value.toInt().toString();

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
