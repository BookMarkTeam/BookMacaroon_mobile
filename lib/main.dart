import 'package:bookmacaroon_mobile/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// Provider Model Import Dart
import 'models/login_model.dart';
import 'screens/login_loading_screen.dart';

void main() async {
  // async main 인경우에 이 코드가 맨 처음줄로 있어야함
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalConfiguration()
      .loadFromPath("resources/config/app_settings.json");
  await Firebase.initializeApp();

  print('main app start');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      create: (context) => LoginModel(),
      child: MaterialApp(
        title: 'Bookmacaroon',
        initialRoute: '/',
        routes: {
          '/login': (context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: true,
        home: LoginLoadingScreen(),
      ),
    );
  }
}
