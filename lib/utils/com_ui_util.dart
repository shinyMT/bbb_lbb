import 'package:flutter/material.dart';

mixin ComUiUtil on StatelessWidget {
  /// 构建带图标的卡片
  static Widget builIconCard(
      {required String title, required Icon icon, Function? onTap}) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          child: InkWell(
            onTap: () {
              onTap?.call();
            },
            child: Card(
              elevation: 4,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 20,
          child: icon,
        ),
      ],
    );
  }

  /// 构建多个Tag列表
  static Widget buildTagList({required List<String> list}) {
    List<Widget> content = [];
    for (var item in list) {
      content.add(buildTagItem(text: item));
      content.add(const SizedBox(
        width: 8.0,
      ));
    }
    return Wrap(
      children: content,
    );
  }

  /// 构建TagItem
  static Widget buildTagItem({required String text}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(text),
    );
  }
}
