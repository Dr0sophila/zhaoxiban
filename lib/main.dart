import 'dart:io';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zhaoxiban/pages/alarmpage/provider/contactsProvider.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';
import 'config/routers/routers.dart';
import 'pages/homepage/page/HomePage.dart';
import 'pages/routine/provider/routineProvider.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isIOS) {
    BMFMapSDK.setApiKeyAndCoordType(
        'KRAQ8agFW9Dsq9lytsBx0OEwrpHqphTU', BMF_COORD_TYPE.BD09LL);
  } else if (Platform.isAndroid) {
// Android 目前不支持接口设置Apikey,
// 请在主工程的Manifest文件里设置，详细配置方法请参考[https://lbs.baidu.com/ 官网][https://lbs.baidu.com/)demo
    BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  }
  Map map = await BMFMapAPI_Map.nativeMapVersion;
  print('获取原生地图版本号：$map');
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final functiondata = FunctionList();
  final contactList = ContactList();
  final languagedata = LanguageSetting();
  final routindata = RoutineList();
  await functiondata.synchronize();
  await languagedata.synchronize();
  await routindata.synchronize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: functiondata),
        ChangeNotifierProvider.value(value: languagedata),
        ChangeNotifierProvider.value(value: contactList),
        ChangeNotifierProvider.value(value: routindata),
      ],
      child: const MyApp(),
    ),
  );
}

final FluroRouter router = FluroRouter();

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    Routes.configureRoutes(router);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'remember to name it',
      home: HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
