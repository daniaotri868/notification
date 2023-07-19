import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notitifcation/local_services.dart';
import 'NewPage.dart';
import 'inj.dart';
import 'main.dart';


class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  static String ?title;
  static String ?body;

  Future<void> initialize() async {
    String? token = await _fcm.getToken();
    print("my token $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService().showNotification(title: message.notification!.title, body: message.notification!.body);
      print('Got a message whilst in the foreground!');
      MyApp.nave.currentState!.push(
        MaterialPageRoute(builder: (context) {
          print('////////////////////////////');
          return NewPage(title: message.notification!.title==null?"no": message.notification!.title!
            ,body: message.notification!.body==null?"no":message.notification!.body!,);
        }),
      );
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
        // display the notification in the UI
      }
    });


    final remoteMessage= await FirebaseMessaging.instance.getInitialMessage();
    if(remoteMessage !=null)
      {
          MyApp.nave.currentState!.push(
            MaterialPageRoute(builder: (context) {
              print("hfghfghfhf");
              return NewPage(
                title: remoteMessage.notification!.title==null?"no": remoteMessage.notification!.title!
                ,body: remoteMessage.notification!.body==null?"no":remoteMessage.notification!.body!,);
              },)
          );
      }

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   MyApp.nave.currentState!.push(
    //     MaterialPageRoute(builder: (context) {
    //       print('////////////////////////////');
    //       return NewPage(title: message.notification!.title!,body: message.notification!.body!,);
    //     }),
    //   );
    // });
  }
}