import 'package:flutter/material.dart';
import 'package:flutter_animation_demo/page1.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: Hero(
        tag: "刘德华",
        child: Image.asset('images/liudehua.jpg',
            height: 400, fit: BoxFit.fitHeight),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Page1();
          }));
        },
      ),
    );
  }
}
