import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'demo.dart';
import 'firebase_options.dart';
import 'firebase_services.dart';
import 'inj.dart';
import 'local_services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService notificationService = NotificationService();
  LocalNotificationService localNotificationService=LocalNotificationService();
  await localNotificationService.initialize();
    // NavLocated().init();
   notificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
static final nave=  GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Cloud Messaging Demo',
      navigatorKey:nave ,
      home: NotificationDemo(),
    );
  }
}

