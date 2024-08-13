import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    super.key,
    required this.data,
    required super.child,
  });

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    return true; // 始终通知子控件
  }

  static T? of<T>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider?.data;
  }
}
