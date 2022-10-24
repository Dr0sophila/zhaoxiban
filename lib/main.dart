import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zhaoxiban/pages/homepage/provider/functionProvider.dart';
import 'package:provider/provider.dart';
import 'pages/homepage/page/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final functiondata = FunctionList();
  await functiondata.synchronize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: functiondata),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final router = fluro.Router();
    // ApplicationRouter.router = router;
    // Routes.configureRoutes(router);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'remember to name it',
      home: HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
