import 'package:flutter/material.dart';

class CountWidget extends InheritedWidget {
  final int count;
  @override // 这里的override是用来覆盖父类中的child属性
  final Widget child;

  const CountWidget({
    required this.count,
    required this.child,
    super.key,
  }) : super(child: child);

  static int? of(BuildContext context) {
    // of静态方法，返回值是一个CountWidget类型，也可能是null，这个方法主要是为了访问InheritedWidget提供的数据或状态
    return context
        .dependOnInheritedWidgetOfExactType<CountWidget>()
        ?.count; // context.dependOnInheritedWidgetOfExactType 用于获取当前构建上下文(context)中最近的一个指定类型的InheritedWidget
  }

  @override
  bool updateShouldNotify(CountWidget oldWidget) {
    // 在什么情况下通知子控件
    return count != oldWidget.count;
  }
}
