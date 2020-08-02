import 'package:flutter/material.dart';
import 'package:eruduyuru/home-screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'announcement-screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.init(
    "35bb201f-e272-406d-ad94-85ff7849c821",
    iOSSettings: null,
  );
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared
      .promptUserForPushNotificationPermission(fallbackToSettings: true);

  bool check;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var IsDepartmentSelected = prefs.getBool("IsDepartmentSelected");

  IsDepartmentSelected == null ? check = false : check = IsDepartmentSelected;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Eru Duyuru",
      //darkTheme:
      //    ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0), brightness: Brightness.dark),
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      home: check ? ListPage() : HomePage(),
    ),
  );
}
