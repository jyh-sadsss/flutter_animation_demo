import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/inherited_provider.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T data;
  final Widget child;
  const ChangeNotifierProvider({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  State<ChangeNotifierProvider<T>> createState() =>
      _ChangeNotifierProviderState<T>();

  static T? of<T>(BuildContext context, {bool listen = true}) {
    // dependOnInheritedWidgetOfExactType 这样的写法会导致不必要的更新，和data不关联的空间也会被重新build
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
            .getElementForInheritedWidgetOfExactType<
                InheritedProvider<T>>() // 这种方法不会更新，只会知道值的变化
            ?.widget as InheritedProvider<T>;
    return provider?.data;
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  @override
  void initState() {
    super.initState();
    widget.data.addListener(_update);
  }

  void _update() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.data.removeListener(_update);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if (oldWidget.data != widget.data) {
      oldWidget.data.removeListener(_update);
      widget.data.addListener(_update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
