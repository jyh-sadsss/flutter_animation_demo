import 'package:flutter/material.dart';

class AutoScaleContainer extends StatefulWidget {
  const AutoScaleContainer({super.key});

  @override
  State<StatefulWidget> createState() => _AutoScaleContainerState();
}

class _AutoScaleContainerState extends State<AutoScaleContainer>
    with SingleTickerProviderStateMixin {
  // 定义一个controller
  late AnimationController _animationController;
  late Animation<double> _animation; // 记录动画差值和状态
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    // 定义另外一个动画的效果
    _animation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    _animation = Tween<double>(begin: 100, end: 300).animate(_animation);
    _animation.addListener(() {
      setState(() {});
    }); // 调用setState刷新动画
    _animationController.addStatusListener((status) {});
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        color: Colors.orange,
        width: _animation.value,
        height: _animation.value,
      ),
    );
  }
}
