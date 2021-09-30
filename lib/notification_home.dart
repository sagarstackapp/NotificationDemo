import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifyHome extends StatefulWidget {
  @override
  NotifyHomeState createState() => NotifyHomeState();
}

class NotifyHomeState extends State<NotifyHome> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notification();
  }

  notification() async {
    print('Notification method called.!');
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    var platform = InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(platform);
  }

  notificationDetails() async {
    var androidNotification = AndroidNotificationDetails(
      'CHANNEL ID',
      "CHANNLE NAME",
      "channelDescription",
      importance: Importance.max,
      priority: Priority.max,
      enableLights: true,
      playSound: true,
    );
    var iosNotification = IOSNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platformNotification =
        NotificationDetails(android: androidNotification, iOS: iosNotification);
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin.show(
        0,
        'Title : ${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}',
        'Body : body',
        platformNotification,
      );
    } else {
      await flutterLocalNotificationsPlugin.show(
        0,
        'Title : ${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}',
        'Body : body',
        platformNotification,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            notificationDetails();
          },
          child: Text('Send notification'),
        ),
      ),
    );
  }
}
