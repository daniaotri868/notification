import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'NewPage.dart';
import 'demo.dart';
import 'firebase_options.dart';
import 'firebase_services.dart';
import 'inj.dart';
import 'local_services.dart';




@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  LocalNotificationService().initialize();
  // MyApp.nave.currentState!.push(
  //   MaterialPageRoute(builder: (context) {
  //     print('//////////////اااااا//////////////');
  //     return NewPage();
  //   }),
  // );
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  LocalNotificationService localNotificationService=LocalNotificationService();
  await localNotificationService.initialize();
  NotificationService notificationService = NotificationService();
  notificationService.initialize();


  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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

