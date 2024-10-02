import 'package:finkin/presentation/dashboard/dashboard.dart';
import 'package:finkin/presentation/dashboard/dashboard_view_model/dashboard_view_model.dart';
import 'package:finkin/presentation/register/register_view_model/register_view_model.dart';
import 'package:finkin/service/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  PushNotification().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:  (context) => RegisterViewModel(),),
        ChangeNotifierProvider(create:  (context) => DashboardViewModel(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Dashboard(),
      ),
    );
  }
}

