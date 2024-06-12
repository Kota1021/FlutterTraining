import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/main_view.dart';

class GreenWidget extends StatefulWidget {
  const GreenWidget({super.key});

  @override
  State<GreenWidget> createState() => _GreenWidgetState();
}

class _GreenWidgetState extends State<GreenWidget> {
  @override
  void initState() {
    super.initState();
    unawaited(_navigateToMainWidget());
  }

  Future<void> _navigateToMainWidget() async {
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

    // 再度 `_navigateToMainWidget` を呼び出す
    await _navigateToMainWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Centerを追加して配置を中央にします。
      child: Container(
        color: Colors.green,
        width: double.infinity, // 幅を指定
        height: double.infinity, // 高さを指定
      ),
    );
  }
}
