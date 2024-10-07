import 'package:flutter/material.dart';

mixin ComUiUtil on StatelessWidget {
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
}
