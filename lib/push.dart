// import 'dart:html';
// import 'dart:js';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// Future<void> handle (RemoteMessage message)async{
//   print("title : ${message.notification?.title}");
//   print("Body : ${message.notification?.body}");
//   print("PayLoad : ${message.data}");
// }
// class PushNotificationManeger{
//   // PushNotificationManeger._();
//   // factory PushNotificationManeger()=> _instance;
//   // static final PushNotificationManeger _instance=PushNotificationManeger._();
//   final  _firebaseMessaging = FirebaseMessaging.instance;
//
//   Future<void> init() async {
//     await _firebaseMessaging.requestPermission();
//     String? token = await _firebaseMessaging.getToken();
//     print("my token $token");
//     FirebaseMessaging.onBackgroundMessage(handle);
//
//     // تحديد الرابط للصفحة المطلوبة
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print("onMessage: $message");
//       if (message.notification != null) {
//         // استخراج الرابط من الـ data وتحديد الصفحة المطلوبة
//         String? route = message.data['route'];
//         if (route != null) {
//           Navigator.pushNamed(context, route);
//         }
//       }
//     });
//   }
//
// }