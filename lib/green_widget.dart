import 'package:flutter/material.dart';

class GreenWidget extends StatefulWidget {
  const GreenWidget({super.key});

  @override
  State<GreenWidget> createState() => _GreenWidgetState();
}

class _GreenWidgetState extends State<GreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        // Centerを追加して配置を中央にします。
        child: Container(
      color: Colors.green,
      width: double.infinity, // 幅を指定
      height: double.infinity, // 高さを指定
    ));
  }
}
