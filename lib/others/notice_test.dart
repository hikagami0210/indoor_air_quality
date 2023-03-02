
//最上位
// final FlutterLocalNotificationsPlugin flnp = FlutterLocalNotificationsPlugin();
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   RemoteNotification? notification = message.notification;
//   flnp.initialize(const InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher')));
//
//   if (notification == null) {
//     return;
//   }
//   // 通知
//   flnp.show(
//       notification.hashCode,
//       "${notification.title}:バックグラウンド",
//       notification.body,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'channel_id',
//           'channel_name',
//         ),
//       ));
// }

//メイン関数
// バックグラウンドでのメッセージ受信イベントを設定
// FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


//init
//
// FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// RemoteNotification? notification = message.notification;
// flnp.initialize(const InitializationSettings(
// android: AndroidInitializationSettings('@mipmap/ic_launcher')));
//
// if (notification == null) {
// return;
// }
// // 通知
// flnp.show(
// notification.hashCode,
// "${notification.title}:フォアグラウンド",
// notification.body,
// const NotificationDetails(
// android: AndroidNotificationDetails(
// 'channel_id',
// 'channel_name',
// ),
// ));
// });