# AMap for Flutter

[![pub package](https://img.shields.io/pub/v/amap_flutter.svg)](https://pub.dev/packages/amap_flutter)

A Flutter plugin that provides a [AMapFlutter](https://lbs.qq.com/map/) widget.

|             | Android | iOS     |
|-------------|---------|---------|
| **Support** | SDK 26+ | iOS 12+ |

## Usage

To use this plugin, add `amap_flutter` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/platform-integration/platform-channels).

## Getting Started

Log in to the AMap Services console to get an API key at <https://console.amap.com/dev/key/app>;
* Go to [AMap Service Console](https://console.amap.com/dev/index), expand the Application Management menu and select My Apps;
* Click Create Application on the right, if you have already created an application, you can directly select Add Key;
* Select platform, enter key name, and enter package name in th panel.

### Initializaition

Before using ```AMapFlutter``` widget, you have to call static method ```init``` of ```AMapFlutter```, for example:
```dart
AMapFlutter.init(
  apiKey: ApiKey(
    iosKey: "a4a1394fe817c2f86a424b897b4a9af4",
    androidKey: "d0065c21d2aedd0b234bfb7b88e5d6b2",
    webKey: "fc9908dc4103f3d8274070bb34ab37af",
  ),
  agreePrivacy: true,
);
```

### Sample Usage

* You can now add a `AMapFlutter` widget to your widget tree. The `AMapFlutter` widget should be used within a widget with a bounded size. Using it in an unbounded widget will cause the application to throw a Flutter exception.

<?code-excerpt "readme_sample.dart (MapSample)"?>
```dart
class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  static const title = 'amap_flutter_example';

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Demo.title),
      ),
      body: AMapFlutter(),
    );
  }
}
```

See the `example` directory for a complete sample app.