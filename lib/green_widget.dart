import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/main_view.dart';
import 'package:flutter_training/on_appear_mixin.dart';

class GreenWidget extends StatefulWidget {
  const GreenWidget({super.key});

  @override
  State<GreenWidget> createState() => _GreenWidgetState();
}

class _GreenWidgetState extends State<GreenWidget> with OnAppearMixin {
  @override
  Future<void> actionOnAppear() async {
    // 500ミリ秒遅延させる
    await Future<void>.delayed(const Duration(milliseconds: 500));

    // Navigator を使って画面遷移
    // ignore: always_put_control_body_on_new_line
    if (!context.mounted) return;
    // Navigator を使って画面遷移
    // ignore: use_build_context_synchronously
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return const MainView();
        },
      ),
    );

    // 再起的に呼び出す
    await actionOnAppear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}
