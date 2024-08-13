import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_demo/change_notifier_provider.dart';
import 'package:flutter_animation_demo/count_widget.dart';
import 'package:flutter_animation_demo/counter.dart';
import 'package:flutter_animation_demo/text_widget.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  const AnimatedSwitcherDemo({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Switcher Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: Text(
                key: ValueKey<int>(_value),
                '$_value',
                style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 40,
                    fontWeight: FontWeight.w700),
              ),
            ),
            CountWidget(count: _value, child: const TextWidget()),
            ChangeNotifierProvider(
                data: Counter(),
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      final counter =
                          ChangeNotifierProvider.of<Counter>(context);
                      print('counter 变化: ${counter?.count}');
                      return Text(
                        counter?.count.toString() ?? 'No Count',
                        style: const TextStyle(fontSize: 40),
                      );
                    }),
                    Builder(builder: (context) {
                      print('button 变化');
                      return ElevatedButton(
                          onPressed: () {
                            ChangeNotifierProvider.of<Counter>(context,
                                    listen: false)
                                ?.increment();
                          },
                          child: const Text('add'));
                    })
                  ],
                )),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _value++;
                  });
                },
                child: const Text('点击+1'))
          ],
        ),
      ),
    );
  }
}
