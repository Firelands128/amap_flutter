import 'package:flutter/material.dart';

/// BuildContext的扩展工具
extension ContextExt on BuildContext {
  /// 显示alert dialog
  Future<void> alert(String title) async {
    return showDialog(
      context: this,
      builder: (_) => AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: Navigator.of(this).pop,
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  /// 显示snack bar
  Future<void> snackBar(String message) async {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
