import 'package:amap_flutter/amap_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pages/add_remove_marker.dart';
import 'pages/map_controls.dart';
import 'pages/map_controls_position.dart';
import 'pages/map_events.dart';
import 'pages/map_features.dart';
import 'pages/map_layers.dart';
import 'pages/map_restriction.dart';
import 'pages/map_setting.dart';
import 'pages/map_styles.dart';
import 'pages/map_types.dart';
import 'pages/map_view.dart';
import 'pages/user_location.dart';

void main() {
  runApp(const App());
}

/// 主程序
class App extends StatefulWidget {
  /// 主程序构造函数
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    AMapFlutter.init(
      apiKey: ApiKey(
        iosKey: "a4a1394fe817c2f86a424b897b4a9af4",
        androidKey: "d0065c21d2aedd0b234bfb7b88e5d6b2",
      ),
      agreePrivacy: true,
    );
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status != PermissionStatus.granted) {
      await Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(),
          disabledColor: Colors.grey,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.dark(),
          disabledColor: Colors.grey[400],
        ),
        home: Scaffold(
          body: ListView(children: [
            Item(MapSettingPage.title, (_) => const MapSettingPage()),
            if (kIsWeb)
              Item(MapStylesPage.title, (_) => const MapStylesPage())
            else
              Item(MapTypesPage.title, (_) => const MapTypesPage()),
            if (kIsWeb) Item(MapFeaturesPage.title, (_) => const MapFeaturesPage()),
            Item(MapControlsPage.title, (_) => const MapControlsPage()),
            Item(MapControlsPositionPage.title, (_) => const MapControlsPositionPage()),
            Item(MapLayersPage.title, (_) => const MapLayersPage()),
            Item(MapViewPage.title, (_) => const MapViewPage()),
            Item(MapRestrictionPage.title, (_) => const MapRestrictionPage()),
            Item(MapEventsPage.title, (_) => const MapEventsPage()),
            Item(AddRemoveMarkerPage.title, (_) => const AddRemoveMarkerPage()),
            Item(UserLocationPage.title, (_) => const UserLocationPage()),
          ]),
        ),
      ),
    );
  }
}

/// 示例项目
class Item extends StatelessWidget {
  /// 示例标题
  final String title;

  /// 示例创建器
  final Widget Function(BuildContext) builder;

  /// 示例项目构造函数
  const Item(this.title, this.builder, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: builder)),
    );
  }
}
