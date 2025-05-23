@JS("AMap")
library amap_flutter;

import 'dart:js_interop';
import 'package:web/web.dart' show HTMLElement;
import 'js.dart';

/// 点标记
@JS("Marker")
extension type MarkerJS._(JSObject _) implements Overlay {
  /// 构造函数
  external MarkerJS(MarkerOptions opts);

  /// 获取点标记的文字提示
  external JSString? getTitle();

  /// 获取 Marker 离地高度 （此方法适用于 JSAPI v2.1Beta 及以上版本）
  external JSNumber? getHeight();

  /// 当点标记未自定义图标时，获取Icon内容
  external Icon? getIcon();

  /// 设置点标记的显示图标，设置了有效 content 则 icon 不生效
  external void setIcon(Icon icon);

  /// 获取点标记文本标签内容
  external Label getLabel();

  /// 设置点标记文本标签内容
  external void setLabel(Label opts);

  /// 获取点标记是否支持鼠标单击事件
  external JSBoolean getClickable();

  /// 设置点标记是否支持鼠标单击事件，默认值: true
  external void setClickable(JSBoolean clickable);

  /// 获取点标记对象是否可拖拽移动
  external JSBoolean getDraggable();

  /// 设置点标记对象是否可拖拽移动
  external void setDraggable(JSBoolean draggable);

  /// 获取该点标记是否置顶
  external JSBoolean getTop();

  /// 地图上有多个marker时，设置是否置顶该点标记
  external void setTop(JSBoolean isTop);

  /// 获取鼠标悬停时的光标设置
  external JSString getCursor();

  /// 设置鼠标悬停时的光标
  external void setCursor(String cursor);

  /// 获取用户自定义数据
  external JSAny getExtData();

  /// 设置用户自定义数据
  external void setExtData(JSAny extData);

  /// 移除点标记
  external void remove();

  /// 以给定时长/速度移动点标记到指定位置, 需加载 AMap.MoveAnimation 插件才可使用
  external void moveTo(LngLat targetPosition, MoveToOptions opts);

  /// 以指定的时长，点标记沿指定的路径移动，加载 AMap.MoveAnimation 后可以使用 JSAPI 2.0 可支持分段设置速度和时长
  external void moveAlong(JSArray<LngLat> path, MoveAlongOptions opts);

  /// 开启点标记动画，加载 AMap.MoveAnimation 后创建的点标记可以使用
  external void startMove();

  /// 停止点标记动画，加载 AMap.MoveAnimation 后创建的点标记可以使用
  external void stopMove();

  /// 暂停点标记动画，加载 AMap.MoveAnimation 后创建的点标记可以使用
  external void pauseMove();

  /// 重新启动点标记动画，加载 AMap.MoveAnimation 后创建的点标记可以使用
  external void resumeMove();

  /// 获取覆盖物的地图实例
  external AMap? getMap();

  /// 将覆盖物设置到地图上
  external void setMap(AMap? map);

  /// 将覆盖物加到地图上
  external void addTo(AMap map);

  /// 将覆盖物加到地图上
  external void add(AMap map);

  /// 显示覆盖物
  external void show();

  /// 隐藏覆盖物
  external void hide();

  /// 获取覆盖物位置
  external JSAny getPosition();

  /// 设置覆盖物位置
  external void setPosition(LngLat position);

  /// 获取覆盖物锚点
  external Pixel? getAnchor();

  /// 设置覆盖物锚点设置点标记锚点。默认值：'top-left' * 可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external void setAnchor(String anchor);

  /// 获取覆盖物偏移量
  external Pixel getOffset();

  /// 设置覆盖物偏移量
  external void setOffset(Pixel offset);

  /// 获取覆盖物旋转角度
  external JSNumber? getAngle();

  /// 设置覆盖物旋转角度
  external void setAngle(num angle);

  /// 如设置了尺寸，获取设置的尺寸
  external Size getSize();

  /// 设置尺寸
  external void setSize(Size size);

  /// 获取覆盖物的叠加顺序
  external JSNumber? getzIndex();

  /// 设置覆盖物的叠加顺序
  external void setzIndex(num zIndex);

  /// 获取覆盖物的所有属性
  external OverlayOptions getOptions();

  /// 获取点标记显示的自定义内容
  external HTMLElement? getContent();

  /// 设置点标记显示的自定义内容，可以是HTML要素字符串或者HTML DOM对象
  external void setContent(HTMLElement content);

  /// 获取点标记范围
  external Bounds getBounds();

  /// 给实例绑定事件回调函数，同一个类型、同一个回调函数、同一个上下文只会绑定一次
  external void on(String type, JSExportedDartFunction function);

  /// 移除当前实例的某一个事件回调
  external void off(String type, JSExportedDartFunction function);
}

extension type MarkerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MarkerOptions() : this._(JSObject());

  /// 要显示该marker的地图对象
  external AMap map;

  /// 点标记在地图上显示的位置
  external LngLat position;

  /// 在点标记中显示的图标。可以传一个图标地址，也可以传Icon对象。有合法的content内容设置时，此属性无效。
  external Icon icon;

  /// 点标记显示内容。可以是HTML要素字符串或者HTML DOM对象。content有效时，icon属性将被覆盖。
  external HTMLElement content;

  /// 鼠标滑过点标记时的文字提示。不设置则鼠标滑过点标无文字提示。
  external JSString title;

  /// 点标记是否可见，默认值：true
  external JSBoolean visible;

  /// 点标记的叠加顺序。地图上存在多个点标记叠加时，通过该属性使级别较高的点标记在上层显示，默认zIndex：12
  external JSNumber zIndex;

  /// 点标记显示位置偏移量，默认值为 [0,0] 。Marker指定position后，默认以marker左上角位置为基准点（若设置了anchor，则以anchor设置位置为基准点），对准所给定的position位置，若需使marker指定位置对准在position处，需根据marker的尺寸设置一定的偏移量。
  external Pixel offset;

  /// 设置点标记锚点，可选值：'top-left','top-center','top-right', 'middle-left', 'center', 'middle-right', 'bottom-left', 'bottom-center', 'bottom-right'
  external JSString anchor;

  /// 点标记的旋转角度，，广泛用于改变车辆行驶方向。默认值：0
  external JSNumber angle;

  /// 点标记是否可点击，默认值: true
  external JSBoolean clickable;

  /// 设置点标记是否可拖拽移动，默认值：false
  external JSBoolean draggable;

  /// 事件是否冒泡，默认为 false
  external JSBoolean bubble;

  /// 点标记显示的层级范围，超过范围不显示。默认值：zooms: [2, 20]
  external JSArray<JSNumber> zooms;

  /// 指定鼠标悬停时的鼠，默认值：'pointer'
  external JSString cursor;

  /// 鼠标点击时marker是否置顶，默认false ，不置顶
  external JSBoolean topWhenClick;

  /// 设置Marker点是否离地绘制，默认值为0，等于0时贴地绘制。大于0时离地绘制，此时Marker点高度等于height值加Marker点高程值（JSAPI v2.1新增属性目前只适用于v2.1版本）。
  external JSNumber height;

  /// 添加文本标注
  external Label label;

  /// 用户自定义属性 ，支持JavaScript API任意数据类型，如 Marker的id等。可将自定义数据保存在该属性上，方便后续操作使用。
  external JSObject extData;
}

extension type Label._(JSObject _) implements JSObject {
  /// 构造函数
  Label() : this._(JSObject());

  /// 文本标注的内容
  external JSString content;

  /// 为偏移量。如设置了 direction，以 direction 方位为基准点进行偏移。
  external Pixel offset;

  /// 文本标注方位 可选值：'top'|'right'|'bottom'|'left'|'center'，默认值: 'right'。
  external JSString direction;
}

extension type MoveToOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MoveToOptions() : this._(JSObject());

  /// 每段动画持续时长, 单位：ms
  external JSNumber duration;

  /// 动画速度，已废弃
  external JSNumber speed;

  /// easing 时间函数
  external EasingCallback easing;

  /// 点标记方向是否沿路径旋转
  external JSBoolean autoRotation;
}

extension type MoveAlongOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MoveAlongOptions() : this._(JSObject());

  /// 每段动画持续时长, 单位：ms
  external JSNumber duration;

  /// 每段动画速度，已废弃
  external JSNumber speed;

  /// easing 时间函数
  external EasingCallback easing;

  /// 动画是否循环
  external JSBoolean circlable;

  /// 延迟动画时长
  external JSNumber delay;

  /// 每段完整动画间隔时长
  external JSNumber aniInterval;

  /// 覆盖物是否沿路径旋转
  external JSBoolean autoRotation;
}

/// 文本标记
extension type Text._(JSObject _) implements Overlay {
  /// 构造函数
  external Text(TextOptions opts);

  /// 获取文本标记内容
  external JSString? getText();

  /// 设置文本标记内容
  external void setText(String text);

  /// 修改文本标记样式。Object同css样式表，如:{'background-color':'red'}
  external void setStyle(JSAny style);

  /// 获取文本标记的文字提示
  external JSString? getTitle();

  /// 设置鼠标滑过文本标记时的文字提示
  external void setTitle(String title);

  /// 获取文本标记是否支持鼠标单击事件
  external JSBoolean getClickable();

  /// 设置文本标记是否支持鼠标单击事件，默认值: true
  external void setClickable(JSBoolean clickable);

  /// 获取文本标记对象是否可拖拽移动
  external JSBoolean getDraggable();

  /// 获取文本标记的地图实例
  external AMap? getMap();

  /// 将文本标记设置到地图上
  external void setMap(AMap? map);

  /// 将文本标记加到地图上，不推荐使用。推荐使用 map.add(text);
  external void addTo(AMap map);

  /// 将文本标记加到地图上
  external void add(AMap map);

  /// 显示文本标记
  external void show();

  /// 隐藏文本标记
  external void hide();

  /// 获取文本标记位置
  external JSAny getPosition();

  /// 设置文本标记位置
  external void setPosition(Pixel position);

  /// 获取文本标记锚点
  external Pixel? getAnchor();

  /// 设置文本标记锚点
  external void setAnchor(Pixel anchor);

  /// 获取文本标记偏移量
  external Pixel? getOffset();

  /// 设置文本标记偏移量，相对 anchor 后的偏移位置
  external void setOffset(Pixel offset);

  /// 获取文本标记旋转角度
  external JSNumber? getAngle();

  /// 设置文本标记旋转角度
  external void setAngle(num angle);

  /// 获取文本标记的叠加顺序
  external JSNumber? getzIndex();

  /// 设置文本标记的叠加顺序
  external void setzIndex(num zIndex);

  /// 获取文本标记的所有属性
  external OverlayOptions getOptions();

  /// 获取文本标记范围
  external Bounds getBounds();

  /// 以给定速度移动文本标记到指定位置, 需加载 AMap.MoveAnimation 插件才可使用
  external void moveTo(LngLat targetPosition, MoveToOptions opts);

  /// 以指定的时长，文本标记沿指定的路径移动，加载 AMap.MoveAnimation 后可以使用
  external void moveAlong(JSArray<LngLat> path, MoveAlongOptions opts);

  /// 开启文本标记动画，加载 AMap.MoveAnimation 后可以使用
  external void startMove();

  /// 停止文本标记动画，加载 AMap.MoveAnimation 后可以使用
  external void stopMove();

  /// 暂停文本标记动画，加载 AMap.MoveAnimation 后可以使用
  external void pauseMove();

  /// 重新启动文本标记动画，加载 AMap.MoveAnimation 后可以使用
  external void resumeMove();

  /// 设置文本标记对象是否可拖拽移动
  external void setDraggable(JSBoolean draggable);

  /// 获取该文本标记是否置顶
  external JSBoolean getTop();

  /// 地图上有多个marker时，设置是否置顶该文本标记
  external void setTop(JSBoolean isTop);

  /// 获取鼠标悬停时的光标设置
  external JSString getCursor();

  /// 设置鼠标悬停时的光标
  external void setCursor(String cursor);

  /// 获取用户自定义数据
  external JSAny getExtData();

  /// 设置用户自定义数据
  external void setExtData(JSAny extData);

  /// 移除点标记
  external void remove();
}

extension type TextOptions._(JSObject _) implements JSObject {
  /// 构造函数
  TextOptions() : this._(JSObject());

  /// 要显示该marker的地图对象
  external AMap map;

  /// 点标记在地图上显示的位置
  external LngLat position;

  /// 标记显示的文本内容
  external Label text;

  /// 鼠标滑过点标记时的文字提示
  external JSString title;

  /// 点标记是否可见，默认为true
  external JSBoolean visible;

  /// 点标记的叠加顺序
  external JSNumber zIndex;

  /// 点标记显示位置偏移量，默认值 [0, 0]
  external Pixel offset;

  /// 设置点标记锚点。默认值：'center'。可选值：'top-left'|'top-center'|'top-right'|'middle-left'|'center'|'middle-right'|'bottom-left'|'bottom-center'|'bottom-right'
  external JSString anchor;

  /// 点标记的旋转角度。默认值：0
  external JSNumber angle;

  /// 点标记是否可点击。默认值: true
  external JSBoolean clickable;

  /// 设置点标记是否可拖拽移动。默认值：false
  external JSBoolean draggable;

  /// 事件是否冒泡，默认值：false
  external JSBoolean bubble;

  /// 点标记显示的层级范围，超过范围不显示。默认值：zooms: [2, 20]
  external JSArray zooms;

  /// 指定鼠标悬停时的鼠标样式
  external JSString cursor;

  /// 鼠标点击时marker是否置顶，默认值: false
  external JSBoolean topWhenClick;

  /// 用户自定义属性 ，支持JavaScript API任意数据类型，如 Marker的id等。可将自定义数据保存在该属性上，方便后续操作使用。
  external JSAny extData;

  /// 设置文本样式，Object同css样式表，如:{'background-color':'red'}
  external JSObject style;
}

/// Icon类表示点标记的图标
extension type Icon._(JSObject _) implements JSObject {
  /// 构造函数
  Icon(IconOpts opts) : this._(JSObject());

  /// 设置图标图片大小
  external void setImageSize(Size size);

  /// 获取图标图片大小
  external JSAny getImageSize();

  /// 设置图标尺寸，默认值(36,36)
  external void setSize(Size size);

  /// 获取图标尺寸
  external JSAny getSize();

  /// 设置图标图片大小
  external void setImageOffset(Pixel offset);

  /// 获取图标取图偏移量。当image中指定了一个大图时，可通过size和imageOffset配合，显示图标的指定范围
  external JSAny getImageOffset();

  /// 获取图标
  external JSAny getImage();

  /// 设置图标
  external void setImage(String image);

  /// 设置原始尺寸
  external void setOriginSize(Size size);

  /// 获取原始尺寸
  external JSAny getOriginSize();
}

extension type IconOpts._(JSObject _) implements JSObject {
  /// 构造函数
  IconOpts() : this._(JSObject());

  /// 图标尺寸，默认值(36,36)
  external Size size;

  /// 图标取图偏移量。当image中指定了一个大图时，可通过size和imageOffset配合，显示图标的指定范围
  external Pixel imageOffset;

  /// 图标的取图地址。默认为蓝色图钉图片
  external JSString image;

  /// 图标所用图片大小，根据所设置的大小拉伸或压缩图片，等同于CSS中的background-size属性。可用于实现高清屏的高清效果
  external Size imageSize;
}

/// 标注类
extension type LabelMarker._(JSObject _) implements Overlay {
  /// 构造函数
  external LabelMarker(LabelMarkerOptions opts);

  /// 获取标注的名称，作为标注标识，并非最终在地图上显示的文字内容
  external JSString? getName();

  /// 设置标注的名称，作为标注标识，并非最终在地图上显示的文字内容
  external void setName(String name);

  /// 获取标注的显示位置
  external LngLat getPosition();

  /// 设置标注的位置
  external void setPosition(LngLat position);

  /// 获取标注显示级别范围
  external JSArray<JSNumber>? getZooms();

  /// 设置显示级别范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 获取标注透明度值
  external JSNumber? getOpacity();

  /// 设置标注透明度
  external void setOpacity(num opacity);

  /// 获取标注的叠加顺序
  external JSNumber? getzIndex();

  /// 设置标注的叠加顺序
  external void setzIndex(num zIndex);

  /// 获取标注的优先级，该优先级用于 labelsLayer 支持避让时，rank 值大的标注会避让掉 rank 值低的标注
  external JSNumber? getRank();

  /// 设置标注的优先级，该优先级用于 labelsLayer 支持避让时，rank 值大的标注会避让掉 rank 值低的标注
  external void setRank(num rank);

  /// 获取标注的文本设置
  external LabelMarkerTextOptions? getText();

  /// 设置标注的文本设置，可设置显示的文字内容和文字样式等
  external void setText(LabelMarkerTextOptions textOpts);

  /// 获取标注的图标设置
  external LabelMarkerIconOptions? getIcon();

  /// 设置标注的图标设置，可设置显示的标注图片
  external void setIcon(LabelMarkerIconOptions iconOpts);

  /// 获取标注的全部属性配置
  external LabelMarkerOptions getOptions();

  /// 获取用户自定义属性
  external JSAny getExtData();

  /// 设置用户自定义属性
  external void setExtData(JSAny extData);

  /// 是否设置置顶标注，设置为 true 表示该标注会显示在所有标注之前
  external void setTop(JSBoolean isTop);

  /// 获取该标注的可见性
  external JSBoolean? getVisible();

  /// 获取该标注是否被避让，从而没有显示
  external JSBoolean? getCollision();

  /// 标注显示
  external void show();

  /// 标注隐藏
  external void hide();

  /// 将自身从标注层移除
  external void remove();

  /// 以给定速度移动标注到指定位置, 需加载 AMap.MoveAnimation 插件才可使用
  external void moveTo(LngLat targetPosition, MoveToOptions opts);

  /// 以指定的时长，标注沿指定的路径移动，加载 AMap.MoveAnimation 后可以使用
  external void moveAlong(JSArray<LngLat> path, MoveAlongOptions opts);

  /// 开启标注动画，加载 AMap.MoveAnimation 后创建的标注可以使用
  external void startMove();

  /// 停止标注动画，加载 AMap.MoveAnimation 后创建的标注可以使用
  external void stopMove();

  /// 暂停标注动画，加载 AMap.MoveAnimation 后创建的标注可以使用
  external void pauseMove();

  /// 重新启动标注动画，加载 AMap.MoveAnimation 后创建的标注可以使用
  external void resumeMove();
}

extension type LabelMarkerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  LabelMarkerOptions() : this._(JSObject());

  /// 标注名称，作为标注标识，并非最终在地图上显示的文字内容，显示文字内容请设置 LabelMarkerTextOptions.content
  external JSString name;

  /// 标注位置
  external LngLat position;

  /// 标注显示级别范围， 可选值： [2,20]
  external JSArray<JSNumber> zooms;

  /// 标注透明度，默认值: 1
  external JSNumber opacity;

  /// 避让优先级，获取标注的优先级，该优先级用于 labelsLayer 支持避让时，rank 值大的标注会避让掉 rank 值低的标注。默认值：1
  external JSNumber rank;

  /// 同一 LabelsLayer 内标注显示层级，数字越大越靠前，默认值: 1
  external JSNumber zIndex;

  /// 标注是否可见， 默认值: true
  external JSBoolean visible;

  /// 用户自定义类型数据，可将自定义数据保存在该属性上，方便后续操作使用
  external JSAny extData;

  /// 标注图标设置
  external LabelMarkerIconOptions icon;

  /// 标注文本设置
  external LabelMarkerTextOptions text;
}

extension type LabelMarkerIconOptions._(JSObject _) implements JSObject {
  /// 构造函数
  LabelMarkerIconOptions() : this._(JSObject());

  /// 图标 url
  external JSString image;

  /// 图标大小，默认值： [36, 36]
  external Size size;

  /// 图标所在图片偏移位置，默认值: [0, 0]
  external Pixel clipOrigin;

  /// 图标所在图片裁剪大小，若未设置，则使用图片大小
  external Size clipSize;

  /// 图标所在图片偏移量,默认值 [0, 0]
  external Pixel offset;

  /// 图标锚点，锚点位置对应设置的 position 位置。可选值：'top-left'| 'top-center'|'top-right'|'middle-left'|'center'| 'middle-right'| 'bottom-left'| 'bottom-center'| 'bottom-right' 。默认值：'top-left'。
  external Pixel anchor;
}

extension type LabelMarkerTextOptions._(JSObject _) implements JSObject {
  /// 构造函数
  LabelMarkerTextOptions() : this._(JSObject());

  /// 文本标注的内容，该属性为直接显示在标注上的文本内容
  external JSString content;

  /// 文本标注方位。若设置了 icon，则 direction 是以 icon 为中心的偏移，若未设置 icon，则相对 position 偏移。 可选值：'top'|'right'|'bottom'|'left'|'center'。默认值: right
  external JSString direction;

  /// 为偏移量，在 direction 基础上的偏移。默认值 [0, 0]
  external Pixel offset;

  /// 文本显示级别范围，可单独设置文本显示范围
  external Pixel zooms;

  /// 文本样式设置
  external TextStyleOptions style;
}

extension type TextStyleOptions._(JSObject _) implements JSObject {
  /// 构造函数
  TextStyleOptions() : this._(JSObject());

  /// 文字大小，默认值： 12
  external JSNumber fontSize;

  /// 文字颜色
  external JSString fillColor;

  // 文字描边颜色
  external JSString strokeColor;

  /// 文字 padding。默认值： [3, 3, 3, 3]
  external JSArray<JSNumber> padding;

  /// 文字背景颜色
  external JSString backgroundColor;

  /// 文字背景描边颜色
  external JSString borderColor;

  /// 文字背景描边粗细
  external JSNumber borderWidth;

  /// 文字是否折行（6个字一折行）
  external JSBoolean fold;
}

/// 灵活点标记
extension type ElasticMarker._(JSObject _) implements Overlay {
  /// 构造函数
  external ElasticMarker(ElasticMarkerOptions opts);

  /// 获取获取灵活点标记标记的文字提示
  external JSString? getTitle();

  /// 设置鼠标滑过灵活点标记时的文字提示
  external void setTitle(String title);

  /// 获取灵活点标记是否支持鼠标单击事件
  external JSBoolean getClickable();

  /// 获取覆盖物的地图实例
  external AMap? getMap();

  /// 将覆盖物设置到地图上
  external void setMap(AMap map);

  /// 显示覆盖物
  external void show();

  /// 隐藏覆盖物
  external void hide();

  /// 获取覆盖物位置
  external JSAny getPosition();

  /// 设置灵活点标记位置
  external void setPosition(LngLat position);

  /// 设置灵活点标记锚点
  external void setAnchor(String anchor);

  /// 获取覆盖物的叠加顺序
  external JSNumber? getzIndex();

  /// 设置覆盖物的叠加顺序
  external void setzIndex(num zIndex);

  /// 获取覆盖物的所有属性
  external OverlayOptions getOptions();

  external Bounds getBounds();

  /// 设置灵活点标记是否支持鼠标单击事件，默认值: true
  external void setClickable(JSBoolean clickable);

  /// 获取灵活点标记对象是否可拖拽移动
  external JSBoolean getDraggable();

  /// 设置灵活点标记对象是否可拖拽移动
  external void setDraggable(JSBoolean draggable);

  /// 获取该灵活点标记是否置顶
  external JSBoolean getTop();

  /// 地图上有多个marker时，设置是否置顶该灵活点标记
  external void setTop(JSBoolean isTop);

  /// 获取鼠标悬停时的光标设置
  external JSString getCursor();

  /// 设置鼠标悬停时的光标
  external void setCursor(String cursor);

  /// 获取用户自定义数据
  external JSAny getExtData();

  /// 设置用户自定义数据
  external void setExtData(JSAny extData);

  /// 移除点标记
  external void remove();
}

extension type ElasticMarkerOptions._(JSObject _) implements JSObject {
  /// 构造函数
  ElasticMarkerOptions() : this._(JSObject());

  /// 要显示该marker的地图对象
  external AMap map;

  /// 点标记在地图上显示的位置
  external LngLat position;

  /// 点标记是否可见，默认为true
  external JSBoolean visible;

  /// 点标记的叠加顺序
  external JSNumber zIndex;

  /// 点标记显示位置偏移量
  external Pixel offset;

  /// 点标记是否可点击
  external JSBoolean clickable;

  /// 设置点标记是否可拖拽移动
  external JSBoolean draggable;

  /// 事件是否冒泡，默认为 false
  external JSBoolean bubble;

  /// 指定鼠标悬停时的鼠标样式
  external JSString cursor;

  /// 鼠标点击时marker是否置顶
  external JSBoolean topWhenClick;

  /// 表示地图级别与styles中样式的映射，{14:0,15:0,16:1,17:1,}表示14到15级使用styles中的第0个样式，16-17级使用第二个样式
  external JSObject zoomStyleMapping;

  /// 用户自定义属性
  external JSAny extData;

  /// 多个不同样式的数组
  external JSArray<ElasticStyle> styles;
}

extension type ElasticStyle._(JSObject _) implements JSObject {
  /// 构造函数
  ElasticStyle() : this._(JSObject());

  /// 灵活标注图标样式类型
  external ElasticIcon icon;

  /// 灵活标注文本样式类型
  external ElasticLabel label;
}

extension type ElasticIcon._(JSObject _) implements JSObject {
  /// 构造函数
  ElasticIcon() : this._(JSObject());

  /// 图标 url
  external JSString img;

  /// 图标显示大小
  external Size size;

  /// 图标锚点
  external Pixel anchor;

  /// 图片偏移量
  external Pixel imageOffset;

  /// 图片大小
  external JSNumber imageSize;

  /// 最合适的级别，在此级别下显示为原始大小
  external JSNumber fitZoom;

  /// 地图放大一级的缩放比例系数
  external JSNumber scaleFactor;

  /// 最大放大比例
  external JSNumber maxScale;

  /// 最小放大比例
  external JSNumber minScale;
}

extension type ElasticLabel._(JSObject _) implements JSObject {
  /// 构造函数
  ElasticLabel() : this._(JSObject());

  /// 文本内容
  external JSString content;

  /// 文本位置相对于图标的基准点，可选值：BL、BM、BR、ML、MR、TL、TM、TR分别代表左下角、底部中央、右下角、左侧中央、右侧中央、左上角、顶部中央、右上角
  external LngLat position;

  /// 相对position的偏移量
  external Pixel offset;

  /// label的最小显示级别
  external JSNumber minZoom;
}

/// 用于展示大量点标记，将点标记按照距离进行聚合，以提高绘制性能。点聚合支持用户自定义样式，以插件形式调用
extension type MarkerCluster._(JSObject _) implements Overlay {
  /// 构造函数
  external MarkerCluster(
    AMap map,
    DataOptions dataOptions,
    MarkerClusterOptions markerClusterOptions,
  );

  /// 在原数据基础上添加数据，格式同 dataOptions
  external void addData(DataOptions dataOptions);

  /// 设置数据，格式同 dataOptions
  external void setData(DataOptions dataOptions);

  /// 获取聚合点的总数量
  external JSNumber getClustersCount();

  /// 获取聚合网格的像素大小
  external JSNumber getGridSize();

  /// 设置聚合网格的像素大小
  external void setGridSize(num size);

  /// 获取地图中点标记的最大聚合级别
  external JSNumber getMaxZoom();

  /// 设置地图中点标记的最大聚合级别
  external void setMaxZoom(num zoom);

  /// 设置样式聚合点，格式同 opts.styles
  external void setStyles(AMap map);

  /// 获取样式
  external JSArray getStyles();

  /// 获取地图对象
  external AMap getMap();

  /// 设置地图对象
  external void setMap(AMap map);

  /// 获取单个聚合点位置是否是聚合内所有标记的平均中心
  external JSBoolean isAverageCenter();

  /// 设置聚合点位置是否是所有聚合点的中心
  external void setAverageCenter(JSBoolean averageCenter);
}

extension type DataOptions._(JSObject _) implements JSObject {
  /// 构造函数
  DataOptions() : this._(JSObject());

  /// 点标记的经纬度信息
  external JSArray<LngLat> lnglat;

  /// 点标记的权重信息，以权重高的点为中心进行聚合
  external JSNumber weight;
}

/// 点聚合属性设置
extension type MarkerClusterOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MarkerClusterOptions() : this._(JSObject());

  /// 聚合计算时网格的像素大小，默认60
  external JSNumber gridSize;

  /// 最大的聚合级别，大于该级别就不进行相应的聚合。默认值为 18，即小于 18 级的级别均进行聚合，18 及以上级别不进行聚合
  external JSNumber maxZoom;

  /// 聚合点的图标位置是否是所有聚合内点的中心点。默认为 true。数据中如果含有权重值，以权重高的点为中心进行聚合
  external JSBoolean averageCenter;

  /// 地图缩放过程中是否聚合。默认值 false
  external JSBoolean clusterByZoomChange;

  /// 指定聚合后的点标记的图标样式
  external JSArray<JSObject> styles;

  /// 该方法用来实现聚合点的自定义绘制
  external JSFunction renderClusterMarker;

  /// 该方法用来实现非聚合点的自定义绘制
  external JSFunction renderMarker;
}

/// 海量点类
extension type MassMarks._(JSObject _) implements Overlay {
  /// 构造函数
  external MassMarks(JSArray<MassData> data, JSArray<MassMarkersOptions> opts);

  /// 设置显示MassMark的地图对象
  external void setMap(AMap map);

  /// 获取Marker所在地图对象
  external JSAny getMap();

  /// 输出MassMark的数据集，数据结构同setDatas中的数据集
  external JSArray<MassData> getData();

  /// 设置MassMark展现的数据集
  external void setData(JSArray<MassData> data);

  /// 获取MassMark的显示样式
  external JSArray<MassMarkersStyleOptions> getStyle();

  /// 设置MassMark的显示样式，可设置单个样式或样式列表，每条数据通过设置的样式索引值获取对应样式
  external void setStyle(JSArray<MassMarkersStyleOptions> style);

  /// 获取海量点图层的透明度
  external JSNumber setOpacity();

  /// 设置海量点图层透明度
  external void setzIndex(num opacity);

  /// 获取海量点图层的透明度
  external JSNumber getzIndex();

  /// 获取海量点图层可见层级范围
  external JSArray<JSNumber> getZooms();

  /// 设置海量点图层可见层级范围
  external void setZooms(JSArray<JSNumber> zooms);

  /// 显示海量点图层
  external void show();

  /// 隐藏海量点图层
  external void hide();

  /// 清除海量点
  external void clear();
}

extension type MassData._(JSObject _) implements JSObject {
  /// 构造函数
  MassData() : this._(JSObject());

  /// 经纬度
  external LngLat lnglat;

  /// 样式索引值
  external JSNumber style;
}

extension type MassMarkersOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MassMarkersOptions() : this._(JSObject());

  /// 图层叠加的顺序值，0表示最底层。默认zIndex：120
  external JSNumber zIndex;

  /// 图层的透明度，取值范围 [0,1] ，1代表完全不透明，0代表完全透明
  external JSNumber opacity;

  /// 支持的缩放级别范围
  external JSArray<JSNumber> zooms;

  /// 指定鼠标悬停时的鼠标样式，自定义cursor，IE仅支持cur/ani/ico格式，Opera不支持自定义cursor
  external JSString cursor;

  /// 用于设置点的样式
  external JSArray<MassMarkersStyleOptions> style;
}

extension type MassMarkersStyleOptions._(JSObject _) implements JSObject {
  /// 构造函数
  MassMarkersStyleOptions() : this._(JSObject());

  /// 必填参数,图标的地址
  external JSString url;

  /// 必填参数，图标的尺寸；例如：size:new AMap.Size(11,11)
  external Size size;

  /// 必填参数，图标显示位置偏移量，以图标的左上角为基准点（0,0）点，例如：anchor:new AMap.Pixel(5,5)
  external Pixel anchor;

  /// 点展示优先级，默认为使用样式的索引值
  external JSNumber zIndex;

  /// 旋转角度
  external JSNumber rotation;
}

/// 用于实现点标记沿线段或者路径轨迹移动的动画基类，可用于满足轨迹回放、实时轨迹等场景。MoveAnimation无需单独声明或初始化，Marker、Text、LabelMarker均已继承了 MoveAnimation的实现。
extension type MoveAnimation._(JSObject _) implements Overlay {
  /// 以给定时间移动点标记到指定位置，加载 AMap.MoveAnimation 后可以使用
  external void moveTo(LngLat targetPosition, MoveToOptions opts);

  /// 以指定的时长，点标记沿指定的路径移动，加载 AMap.MoveAnimation 后可以使用
  external void moveAlong(JSArray<LngLat> path, MoveAlongOptions opts);

  /// 开启点标记动画，加载 AMap.MoveAnimation 后可以使用
  external void startMove();

  /// 停止点标记动画，加载 AMap.MoveAnimation 后可以使用
  external void stopMove();

  /// 重新启动点标记动画，加载 AMap.MoveAnimation 后可以使用
  external void resumeMove();
}

/// MoveAnimation 回调函数扩展类型
extension type AnimationCallback(JSFunction _) implements JSFunction {
  external JSNumber call(num index, LngLat data);
}

/// 时间函数回调扩展类型
extension type EasingCallback(JSFunction _) implements JSFunction {
  external JSNumber call(num passedTime);
}
