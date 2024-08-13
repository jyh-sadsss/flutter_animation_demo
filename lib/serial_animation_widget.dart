import 'package:flutter/material.dart';

class SerialAnimationWidget extends StatefulWidget {
  const SerialAnimationWidget({super.key});

  @override
  State<StatefulWidget> createState() => _SerivalAnimationWidgetState();
}

class _SerivalAnimationWidgetState extends State<SerialAnimationWidget>
    with SingleTickerProviderStateMixin {
  // 定义动画相关
  late final AnimationController _animationCtroller;
  late final Animation<double> _width;
  late final Animation<double> _height;
  late final Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _animationCtroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    final Tween<double> tween = Tween(begin: 100, end: 300);
    _width = tween.animate(CurvedAnimation(
        parent: _animationCtroller,
        curve: const Interval(0, 1.0 / 3, curve: Curves.easeIn)));
    _height = tween.animate(CurvedAnimation(
        parent: _animationCtroller,
        curve: const Interval(1.0 / 3, 2.0 / 3, curve: Curves.easeIn)));

    final ColorTween colorTween =
        ColorTween(begin: Colors.green, end: Colors.blue);
    _color = colorTween.animate(CurvedAnimation(
        parent: _animationCtroller,
        curve: const Interval(2.0 / 3, 1, curve: Curves.easeIn)));
    _animationCtroller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('serial animation demo'),
      ),
      body: AnimatedBuilder(
        animation: _animationCtroller,
        builder: (context, child) {
          // 没设置child
          return Container(
              width: _width.value, height: _height.value, color: _color.value);
        },
      ),
    );
  }

  // 销毁controller
  @override
  void dispose() {
    _animationCtroller.dispose();
    super.dispose();
  }
}
