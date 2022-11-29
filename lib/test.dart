import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';

class TestBaiduMapPage extends StatefulWidget {
  @override
  _TestBaiduMapPageState createState() => _TestBaiduMapPageState();
}

class _TestBaiduMapPageState extends State<TestBaiduMapPage> {
  BMFMapController dituController;
  @override
  void initState() {
    super.initState();
  }

  /// 创建完成回调
  void onBMFMapCreated(BMFMapController controller) {
    dituController = controller;
    /// 地图加载回调
    dituController?.setMapDidLoadCallback(callback: () {
      print('mapDidLoad-地图加载完成!!!');
    });
  }

  BMFLocation location = BMFLocation(
      coordinate: BMFCoordinate(39.917215, 116.380341),
      altitude: 0,
      horizontalAccuracy: 5,
      verticalAccuracy: -1.0,
      speed: -1.0,
      course: -1.0);
  /// 设置地图参数
  BMFMapOptions initMapOptions() {
    BMFMapOptions mapOptions = BMFMapOptions(
      center: BMFCoordinate(39.917215, 116.380341),
      zoomLevel: 12,
      changeCenterWithDoubleTouchPointEnabled: true,
      gesturesEnabled: true,
      scrollEnabled: true,
      zoomEnabled: true,
      rotateEnabled: true,
      compassPosition: BMFPoint(0, 0),
      showMapScaleBar: false,
      maxZoomLevel: 15,
      minZoomLevel: 8,
//      mapType: BMFMapType.Satellite
    );
    return mapOptions;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: BMFMapWidget(
          onBMFMapCreated: (controller) {
            onBMFMapCreated(controller);
          },
          mapOptions: initMapOptions(),
        ),
      ),
    );
  }
}
