import 'package:bbb_lbb/modules/poop/poop.dart';
import 'package:bbb_lbb/pages/home/cook/cook.dart';
import 'package:bbb_lbb/pages/home/test/test.dart';
import 'package:bbb_lbb/utils/com_ui_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildFirstLine(),
          _buildSecondLine(),
          _buildThirdLine(),
        ],
      ),
    );
  }

  /// 第一行
  Widget _buildFirstLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: ComUiUtil.builIconCard(
              title: '纪念日',
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onTap: () {
                print("点击了纪念日");
              }),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: ComUiUtil.builIconCard(
            title: '礼物柜',
            icon: const Icon(
              Icons.card_giftcard,
              color: Colors.blue,
            ),
            onTap: () {
              print("点击了礼物柜");
            },
          ),
        ),
      ],
    );
  }

  /// 第二行卡片
  Widget _buildSecondLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: ComUiUtil.builIconCard(
            title: '私家厨房',
            icon: const Icon(
              Icons.restaurant_menu,
              color: Color.fromARGB(255, 218, 215, 44),
            ),
            onTap: () {
              Get.to(() => const CookPage());
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: ComUiUtil.builIconCard(
            title: '便便记录',
            icon: const Icon(
              Icons.health_and_safety,
              color: Colors.grey,
            ),
            onTap: () {
              Get.to(() => PoopPage());
            },
          ),
        ),
      ],
    );
  }

  /// 第三行卡片
  Widget _buildThirdLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: ComUiUtil.builIconCard(
            title: '家庭消费',
            icon: const Icon(
              Icons.currency_exchange,
              color: Colors.blue,
            ),
            onTap: () {
              Get.to(() => const CookPage());
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 1,
          child: ComUiUtil.builIconCard(
            title: '测试模块',
            icon: const Icon(
              Icons.currency_exchange,
              color: Colors.blue,
            ),
            onTap: () {
              Get.to(() => const TestPage());
            },
          ),
        ),
      ],
    );
  }
}
