import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mehendi_design_app/src/entry_loading_screen.dart';
import 'package:mehendi_design_app/src/initial_binding.dart';
import 'package:mehendi_design_app/utils/app_theme.dart';
import 'package:mehendi_design_app/utils/constants.dart';
import 'package:mehendi_design_app/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Mehendi Design App',
        debugShowCheckedModeBanner: false,
        theme: lightThemeData,
        initialBinding: InitialBinding(),
        initialRoute: EntryLoadingScreen.routeName,
        getPages: routes,
      );
}
