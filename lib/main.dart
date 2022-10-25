import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/language/provider/languageProvider.dart';
import 'config/routers/routers.dart';
import 'pages/homepage/page/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final functiondata = FunctionList();
  final languagedata = Language();
  await functiondata.synchronize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: functiondata),
        ChangeNotifierProvider.value(value: languagedata),
      ],
      child: const MyApp(),
    ),
  );
}

final FluroRouter router = FluroRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
