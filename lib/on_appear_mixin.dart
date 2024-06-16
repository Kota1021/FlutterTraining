import 'package:flutter/material.dart';

mixin OnAppearMixin<T extends StatefulWidget> on State<T> {
  Future<void> actionOnAppear();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await actionOnAppear();
    });
  }
}
