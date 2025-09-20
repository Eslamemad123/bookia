import 'package:bookia/core/routes/route.dart';
import 'package:bookia/core/services/API/dio_provider.dart';
import 'package:bookia/core/services/local/LocalHelper.dart';
import 'package:bookia/core/utils/app%20color.dart';
import 'package:bookia/features/splash/page/splash.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future.value([await Dio_Provider.intit(), await Local_helper.init()]);
  runApp(const MainApp());
}
/*void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MainApp(), // Wrap your app
  ),
);*/

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DM Serif Display',
        scaffoldBackgroundColor: App_Color.white,
      ),
    );
  }
}
