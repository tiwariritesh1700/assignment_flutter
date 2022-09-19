import 'package:assignment_flutter/repositiory/local_storage.dart';
import 'package:assignment_flutter/theme/app_string.dart';
import 'package:assignment_flutter/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app/controller/encryption_controller.dart';
import 'app/controller/task_controller.dart';
import 'app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:assignment_flutter/app/controller/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final localStorageService = LocalStorageService();
  await localStorageService.initializeHive();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_)=> LoginController()),
        ChangeNotifierProvider(create: (_)=>TaskController()),
        ChangeNotifierProvider(create: (_)=>EncryptionController()),

      ],
      child: MaterialApp(
        title: AppString.tittle,
        debugShowCheckedModeBanner: false,

        routes: Routes.allRoutes,
        initialRoute: Routes.INITIAL,
        theme: AppTheme.lightTheme,



      ),
    );
  }
}


