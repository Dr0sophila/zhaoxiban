import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zhaoxiban/config/request/methods.dart';
import 'package:zhaoxiban/pages/buspage/page/busroute.dart';

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> {
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
        print(result);
        // updateUserLocation(result);
        print(result.getMap());
        this.result = result.getMap();
        if (this.result["address"] != null) {
          _myLocPlugin.stopLocation();
        }
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

  TextEditingController Controllerdes = TextEditingController();
  final FocusNode focusNodedes = FocusNode();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data;
    _myLocPlugin.startLocation();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: const Color.fromRGBO(37, 51, 101, 1),
          title: const Text(
            "坐公交",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/busbackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                  width: MediaQuery.of(context).size.width,
                ),
                Card(
                  color: const Color.fromRGBO(232, 232, 232, 1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width * 3 / 4,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: TextField(
                        focusNode: focusNodedes,
                        controller: Controllerdes,
                        style: const TextStyle(
                            fontSize: 25.0, color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '长按说出要去哪里',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'WorkSansSemiBold',
                              fontSize: 30.0),
                        ),
                        onSubmitted: (_) {},
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width * 0.6,
                      // margin: EdgeInsets.all(30.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(37, 51, 101, 1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        "点击确认目的地",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () async {
                      _myLocPlugin.stopLocation();
                      Map<String, dynamic> data = {
                        "city": "福州市",
                        "destination": Controllerdes.text,
                        "origin": result["address"]
                      };
                      var res =
                          await DioUtil.qpostRequest("bus", formData: data);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return BusRoute(
                          from: result["address"],
                          to: Controllerdes.text,
                          info: res["data"]["route"]["transits"],
                        );
                      }));
                    }),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.21,
                        child: MaterialButton(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: const Image(
                                image:
                                    AssetImage("assets/img/recordposition.png"),
                              )),
                          onPressed: () {},
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.09,
                        right: MediaQuery.of(context).size.width * 0.15,
                        child: MaterialButton(
                          child: Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: const Image(
                                image: AssetImage("assets/img/card.png"),
                              )),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
