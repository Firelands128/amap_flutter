## 0.5.1

Add "minZoomLevel" and "maxZoomLevel" property of "AMapFlutter".

## 0.5.0

Add "initFitPositions" in "AMapFlutter".

Add "fitPositions" field in "MapInitConfig".

Use "_AMapApiCodec" as "creationParamsCodec" when creating "AndroidView" and "UiKitView".

When map initializing completed, move camera to fit positions in Android and iOS.

Recover "Position" custom type.

Add "EdgePadding" utility and expose utilities.

Remove the deprecated option 'android.enableR8'.

Upgrade android gradle plugin and compileSdk.

## 0.4.1

Include "latlong2" dependency in "amap_flutter" dependency.

## 0.4.0

Use "geolocator" dependency instead of self defined "Position".

Upgrade Android gradle configuration and iOS configuration.

## 0.3.2

Make ```position``` of ```CameraPosition``` as un-nullable.

## 0.3.1

Make sure "amap" library is loaded when setting api key on web.

Update README.md.

## 0.3.0

Add ```webKey``` property of ```ApiKey```.

Asynchronously load JS API in ```setApiKey``` method of ```AMapFlutterWebController```.

## 0.2.2

Change return type of "init" method of "AMapFlutter" to "Future".

## 0.2.1

Change ```MapView``` to ```TextureMapView```.

## 0.2.0

Use "LatLng" from "latlong2" dependency in public apis.

## 0.1.0

! According to [Flutter issue #143922](https://github.com/flutter/flutter/issues/143922), 
  add ResizeObserver to make sure creating AMap element after map container div attached to the DOM.

Change the direction of map control offset to center on iOS.

Extract checking platform as a common utility.

Use 'dart:ui_web' instead of 'dart:ui_web'.

Upgrade dependencies, and update environment restriction.

Update example app.

Clean up code.

## 0.0.2

Add GitHub Actions configuration to automatically publish to pub.dev from Github.

Lint code and reformat code.

## 0.0.1

Initial release.
