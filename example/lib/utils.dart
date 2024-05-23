import 'dart:io';

import 'package:flutter/foundation.dart';
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

enum PlatformEnum {
  android,
  ios,
  web,
  unknown,
}

class PlatformUtil {
  static PlatformEnum get platform {
    if (kIsWeb) {
      return PlatformEnum.web;
    } else if (Platform.isAndroid) {
      return PlatformEnum.android;
    } else if (Platform.isIOS) {
      return PlatformEnum.ios;
    } else {
      return PlatformEnum.unknown;
    }
  }

  static const bool isWeb = kIsWeb;
  static final bool isAndroid = !kIsWeb && Platform.isAndroid;
  static final bool isIOS = !kIsWeb && Platform.isIOS;
}
