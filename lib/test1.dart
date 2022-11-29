import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:permission_handler/permission_handler.dart';

class OnePosition extends StatefulWidget {
  const OnePosition({Key key}) : super(key: key);

  @override
  State<OnePosition> createState() => _OnePositionState();
}

class _OnePositionState extends State<OnePosition> {
  final LocationFlutterPlugin _myLocPlugin = LocationFlutterPlugin();

  Map result = {};
  @override
  void initState() {
    super.initState();
    requestPermission();

    /// 设置用户是否同意SDK隐私协议
    /// since 3.1.0 开发者必须设置
    BMFMapSDK.setAgreePrivacy(true);
    _myLocPlugin.setAgreePrivacy(true);

    locationAction();

    ///接受定位回调
    _myLocPlugin.seriesLocationCallback(callback: (BaiduLocation result) {
      setState(() {
        print("连续定位会低矮111111");
        print(result);
        // updateUserLocation(result);
        print(result.getMap());
        this.result = result.getMap();
        print("大运");
      });
    });
  }

  void locationAction() async {
    /// 设置android端和ios端定位参数
    /// android 端设置定位参数
    /// ios 端设置定位参数
    Map iosMap = _initIOSOptions().getMap();
    Map androidMap = _initAndroidOptions().getMap();

    await _myLocPlugin.prepareLoc(androidMap, iosMap);
  }

// 动态申请定位权限
  void requestPermission() async {
    // 申请权限
    bool hasLocationPermission = await requestLocationPermission();
    if (hasLocationPermission) {
      // 权限申请通过
    } else {}
  }

  /// 申请定位权限
  /// 授予定位权限返回true， 否则返回false
  Future<bool> requestLocationPermission() async {
    //获取当前的权限
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  /// 设置地图参数
  BaiduLocationAndroidOption _initAndroidOptions() {
    BaiduLocationAndroidOption options = BaiduLocationAndroidOption(
        locationMode: BMFLocationMode.hightAccuracy,
        isNeedAddress: true,
        isNeedAltitude: true,
        isNeedLocationPoiList: true,
        isNeedNewVersionRgc: true,
        isNeedLocationDescribe: true,
        openGps: true,
        scanspan: 4000, //这里如果设置为 0 就是单次定位
        coordType: BMFLocationCoordType.bd09ll);
    return options;
  }

  BaiduLocationIOSOption _initIOSOptions() {
    BaiduLocationIOSOption options = BaiduLocationIOSOption(
        coordType: BMFLocationCoordType.bd09ll,
        desiredAccuracy: BMFDesiredAccuracy.best,
        allowsBackgroundLocationUpdates: true,
        pausesLocationUpdatesAutomatically: false);
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("定位"),
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: InkWell(
                onTap: () {
                  print("停止定位");
                  // _stopLocation();
                  _myLocPlugin.stopLocation();
                  setState(() {
                    result = {};
                  });
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                ),
              )),
          Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  print("开始定位");
                  _myLocPlugin.startLocation();
                },
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                ),
              )),
          Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.amber[100],
                child: Text("${result}"),
              ))
        ],
      ),
    );
  }
}
