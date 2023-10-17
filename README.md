# AMap for Flutter

<?code-excerpt path-base="example/lib"?>

[![pub package](https://img.shields.io/pub/v/google_maps_flutter.svg)](https://pub.dev/packages/google_maps_flutter)

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

#### Android and iOS
You have to set api key and agree privacy before build AMapFlutter by calling ```AMapFlutter.setApiKey()``` and ```AMapFlutter.agreePrivacy()```.

#### Web platform
* Add script element in ```index.html``` in example app to set version, apiKey, and plugins.

```html
<script type="text/javascript" 
src="https://webapi.amap.com/maps?v=2.1Beta&key=/*apiKey*/
&plugin=AMap.ToolBar,AMap.ControlBar,AMap.Scale,AMap.HawkEye,AMap.MapType,AMap.Geolocation"></script>
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