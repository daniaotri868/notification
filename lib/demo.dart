import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NewPage.dart';
import 'firebase_services.dart';
import 'inj.dart';
import 'main.dart';

class NotificationDemo extends StatelessWidget {
  final  navigatorKey;
  final NotificationService _notificationService = NotificationService();

   NotificationDemo({super.key, this.navigatorKey});

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
                MyApp.nave.currentState!.push(
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