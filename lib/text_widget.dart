import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/count_widget.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final count = CountWidget.of(context); // 传入context上下文
    return Text(
      count?.toString() ?? 'No Data',
      style: const TextStyle(fontSize: 25),
    );
  }
}
