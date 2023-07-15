import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NewPage.dart';
import 'firebase_services.dart';

class NotificationDemo extends StatefulWidget {
  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  final NotificationService _notificationService = NotificationService();
  final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Cloud Messaging Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the app content.'),
            ElevatedButton(
              onPressed: () {
                navigatorKey.currentState!.push(
                  MaterialPageRoute(builder: (context) => NewPage()),
                );
              },
              child: Text('Go to New Page'),
            ),
          ],
        ),
      ),
    );
  }
}