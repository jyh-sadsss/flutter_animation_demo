import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_demo/animated_switcher_demo.dart';
import 'package:flutter_animation_demo/auto_scale_container.dart';
import 'package:flutter_animation_demo/auto_scale_transition.dart';
import 'package:flutter_animation_demo/page1.dart';
import 'package:flutter_animation_demo/scale_page_route.dart';
import 'package:flutter_animation_demo/serial_animation_widget.dart';

import 'auto_scale_container2.dart';

void main() {
  return runApp(const MaterialApp(title: 'animation demo', home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // 定义一个animation
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        Tween<double>(begin: 100, end: 300).animate(_animationController);
    // 执行动画
    _animationController.forward();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('main page')),
        body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.purple, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const Page1();
                // }));
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         pageBuilder: (context, animation, secondaryAnimation) {
                //       // 只设置这个没有动画效果
                //       return const Page1();
                //     }, transitionsBuilder:
                //             (context, animation, secondaryAnimation, child) {
                //       const begin = Offset(0, 1.0); // 开始，底部位置
                //       const end = Offset.zero; // 结束，顶部位置
                //       // 定义动画效果
                //       const curve = Curves.ease; // 先快后慢
                //       final tween = Tween<Offset>(begin: begin, end: end);
                //       final cureAnimation =
                //           CurvedAnimation(parent: animation, curve: curve);
                //       // final tween = Tween<Offset>(begin: begin, end: end)
                //       //     .chain(CurveTween(curve: curve));
                //       return SlideTransition(
                //         position: tween.animate(cureAnimation),
                //         child: child,
                //       );
                //     }));
                Navigator.push(context, ScalePageRoute(builder: (context) {
                  // return const SerialAnimationWidget();
                  return const AnimatedSwitcherDemo();
                }));
              },
              child: const Text('跳转到page1'),
            ),
          ),
        ));
  }
}
