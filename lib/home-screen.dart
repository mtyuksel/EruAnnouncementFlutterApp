import 'package:eruduyuru/announcement-screen.dart';
import 'package:eruduyuru/layout.dart';
import 'package:eruduyuru/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    OneSignal.shared
        .setNotificationReceivedHandler((OSNotification notification) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListPage(),
        ),
      );
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListPage(),
        ),
      );
    });
  }

  String selectedDep = "bm";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<DropdownMenuItem<String>> listDrop = [
      DropdownMenuItem(
        child: Text(
          "Bilgisayar Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "bm",
      ),
      DropdownMenuItem(
        child: Text(
          "Biyomedikal Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "biomed",
      ),
      DropdownMenuItem(
        child: Text(
          "Çevre Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "cevre",
      ),
      DropdownMenuItem(
        child: Text(
          "Elektrik Elektronik Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "em",
      ),
      DropdownMenuItem(
        child: Text(
          "Endüstri Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "endustri",
      ),
      DropdownMenuItem(
        child: Text(
          "Endüstriyel Tas. Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "etm",
      ),
      DropdownMenuItem(
        child: Text(
          "Enerji Sis. Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "esm",
      ),
      DropdownMenuItem(
        child: Text(
          "Gıda Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "gida",
      ),
      DropdownMenuItem(
        child: Text(
          "Harita Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "harita",
      ),
      DropdownMenuItem(
        child: Text(
          "İnşaat Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "insaat",
      ),
      DropdownMenuItem(
        child: Text(
          "Makine Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "me",
      ),
      DropdownMenuItem(
        child: Text(
          "Malzeme Bil. Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "mbm",
      ),
      DropdownMenuItem(
        child: Text(
          "Mekatronik Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "mekatronik",
      ),
      DropdownMenuItem(
        child: Text(
          "Tekstil Müh.",
          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 4),
        ),
        value: "tekstil",
      ),
    ];

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    debugPrint("Width = $width , height = $height");
    ScreenUtil.init(context,
        width: width, height: height, allowFontScaling: true);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
                clipper: MyClipper(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      height: SizeConfig.blockSizeVertical * 41,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 40.w, 0, 0),
                        child: version(),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.blue.shade300,
                            Color(0xFF11249F),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, SizeConfig.blockSizeVertical * 7, 0, 0),
                        child: Image.asset("assets/images/erulogo.png",
                            width: SizeConfig.blockSizeVertical * 37,
                            alignment: Alignment.bottomCenter),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 1,
              width: double.infinity,
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 27,
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.001,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.topRight,
                  colors: [
                    Colors.grey.shade50,
                    Colors.blue.shade50,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Bölüm Seçiniz:",
                    style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 4.7,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                    width: double.infinity,
                  ),
                  Container(
                    child: Center(
                      child: DropdownButton(
                        value: selectedDep,
                        items: listDrop,
                        onChanged: (item) {
                          setState(() {
                            selectedDep = item;
                          });
                          print("$item");
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2,
                    width: double.infinity,
                  ),
                  RaisedButton(
                    child: Text(
                      "Seçimi Onayla",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.blockSizeHorizontal * 4.1,
                      ),
                    ),
                    color: Color(0xFF11249F),
                    onPressed: () {
                      oneSignalRegister();
                      selectDepartman(selectedDep);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20.w),
                    alignment: Alignment.center,
                    child: Text(
                      '*Bölüm seçiminizi daha sonra "Ayarlar" sekmesinden değiştirebilirsiniz.',
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 2.5),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => launch('https://www.linkedin.com/in/mtyuksel/'),
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                height: SizeConfig.blockSizeVertical * 13,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/linkedin.png"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: assignment(),
    );
  }

  Future<void> selectDepartman(selectedDep) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("IsDepartmentSelected", true);
    prefs.setString("selectedDepartment", selectedDep);
  }

  oneSignalRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isNotifyOn = prefs.getBool("isNotificationOn");
    var isRegisterBefore = prefs.getBool("IsDepartmentSelected");
    if (isNotifyOn) {
      if (isRegisterBefore == null) {
        OneSignal signal = new OneSignal();
        signal.sendTag("user_type", selectedDep);
      } else {
        OneSignal signal = new OneSignal();
        signal.deleteTag("user_type");
        signal.sendTag("user_type", selectedDep);
      }
    } else {
      debugPrint("NotifyIsOff_HomeScreen");
    }
  }

  getCurrentDepartment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String selectedDep = prefs.getString("selectedDepartment");
    return selectedDep == null ? "bm" : selectedDep;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
