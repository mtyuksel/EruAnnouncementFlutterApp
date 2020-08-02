import 'package:eruduyuru/about-ui.dart';
import 'package:eruduyuru/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool value;

  Future<bool> getNotifyInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool check = await prefs.getBool("isNotificationOn");
    debugPrint("CHECK= $check");
    if (check == null) {
      return true;
    } else {
      return check;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(brightness: Brightness.dark),
        child: Scaffold(
          body: FutureBuilder(
            future: getNotifyInfo(),
            builder: (context, sonuc) {
              if (sonuc.hasData) {
                debugPrint("HERE");

                value = sonuc.data;
                debugPrint("Sonuç.data = $value");
                return SettingsList(
                  sections: [
                    SettingsSection(
                      title: 'Ayarlar',
                      tiles: [
                        SettingsTile.switchTile(
                          title: 'Duyuru Bildirimleri',
                          leading: Icon(Icons.notifications),
                          switchValue: value,
                          onToggle: (bool rValue) {
                            debugPrint("rvalue = $rValue");
                            setState(() {
                              value = rValue;
                            });
                            oneSignalOperation(value);
                            debugPrint("value = $value");
                          },
                        ),
                        SettingsTile(
                          title: 'Bölüm Seçimi',
                          leading: Icon(Icons.settings),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                        ),
                        SettingsTile(
                          title: 'Uygulama Hakkında',
                          leading: Icon(Icons.info),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutPage(),
                              ),
                            );
                          },
                        ),
                        SettingsTile(
                          title: 'Geliştirici Ol',
                          leading: Icon(Icons.developer_mode),
                          onTap: () => launch("https://github.com/mtyuksel/eruDuyuruMobileApp"),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }

  oneSignalOperation(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    OneSignal signal = new OneSignal();
    if (value) {
      var isDepartmentSelected = prefs.getBool("IsDepartmentSelected");
      if (isDepartmentSelected) {
        String selectedDepartment = prefs.getString("selectedDepartment");
        signal.sendTag("user_type", selectedDepartment);
        prefs.setBool("isNotificationOn", true);
      } else {
        debugPrint("isDepartmentSelected = FALSE!");
      }
    } else {
      debugPrint("Else BLOGU");
      signal.deleteTag("user_type");
      prefs.setBool("isNotificationOn", false);
    }
  }
}
