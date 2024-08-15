import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';

class PushNotification {
    final _firebaseMessaging = FirebaseMessaging.instance;

      final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is user for importance notifications',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

    Future handleMessage(RemoteMessage? message) async {
    if(message == null) return;
    showSimpleNotification(
              Text(message.notification!.title!),
              subtitle: Text(message.notification!.body!),
              background: Colors.cyan.shade700,
              duration: const Duration(seconds: 2),
            );
  }

  Future initLocalNotofications() async {
    // const ios = InitializationSettingIos('');
    const android = AndroidInitializationSettings('');
    const settings = InitializationSettings(
      android: android, 
      // iOS: ios,
      // macOS: macos,
      );

    // await _localNotifications.initialize(
    //   settings,
      
    //   onDidReceiveNotificationResponse: (payload) {
    //     final message = RemoteMessage.fromMap(jsonDecode(payload as String));
    //     handleMessage(message);
    //   }
    // );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future notifiyDesign () async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onMessage.listen((Message) {

      final notification = Message.notification;
      if(notification == null )return;
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
            )
        ),
        payload: jsonEncode(Message.toMap()),
        );
     });

  }

    Future initNotification() async {
      await _firebaseMessaging.requestPermission();
      final fcmToken = await _firebaseMessaging.getToken();
      print("fcmtoken : ${fcmToken}");
      notifiyDesign();
    }
}