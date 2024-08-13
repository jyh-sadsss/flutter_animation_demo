import 'package:flutter/material.dart';

class AutoScaleContainer2 extends AnimatedWidget {
  // 直接传animation控制动画
  Animation<double> animation;
  AutoScaleContainer2({super.key, required this.animation})
      : super(
            listenable:
                animation); // 调用父类的构造函数，传递Listenable类型对象，animation是一个Animation类型对象，实现了Listenable接口

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
          color: Colors.pinkAccent,
          width: animation.value,
          height: animation.value),
    );
  }
}
