import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ojt_irfan/config/router/app_router.dart';

import 'package:ojt_irfan/config/theme/app_theme.dart';
import 'package:ojt_irfan/screen/home/view/home_screen.dart';
import 'package:ojt_irfan/service/database/database_config.dart';
import 'package:ojt_irfan/utils/simple_bloc_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseConfig().initDatabase();
  Bloc.observer = SimpleBlocDelegate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      navigatorKey: AppRouter.navigatorKey,
      onGenerateRoute: AppRouter.generatePageList,
      theme: AppTheme.lightThemeMode(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
