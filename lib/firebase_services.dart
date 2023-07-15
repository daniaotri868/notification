import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notitifcation/local_services.dart';
import 'NewPage.dart';


class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();


  Future<void> initialize() async {
    String? token = await _fcm.getToken();
    print("my token $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService().showNotification(title: message.notification!.title, body: message.notification!.body);
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        // display the notification in the UI
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (context) => NewPage()),
      );
    });
  }
}