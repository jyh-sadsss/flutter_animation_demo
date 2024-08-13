import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Hero(
        tag: "刘德华",
        child: Image.asset('images/liudehua.jpg',
            height: 100, fit: BoxFit.fitHeight),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Page2();
          }));
        },
      ),
    );
  }
}
