import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(brightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          brightness: Brightness.dark,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child:
                          Image.asset("assets/images/erulogo.png", height: 220),
                    ),
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Hakkında",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Bu uygulama; Erciyes Üniversitesi bölümleri tarafından yapılan duyuruların kullanıcı ile daha efektif bir biçimde buluşması amacı ile geliştirilmiştir. Kullanıcı tarafından seçilen bölümün resmi websitesinde yeni bir duyuru yayınlandığında ya da mevcut duyuru güncellendiğinde kullanıcı bildirim alacaktır.",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Geliştiriciler",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.code),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                          "M. Tevfik Yüksel - Mobile App (Flutter - Dart)"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        onTap: () => launch("https://www.linkedin.com/in/mtyuksel/"),
                        child: Image.asset(
                          "assets/images/linked-in.png",
                          height: 20,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        child: GestureDetector(
                          onTap: () => launch("https://github.com/mtyuksel"),
                          child: Image.asset(
                            "assets/images/github-logo.png",
                            height: 25,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.code),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                          "Ceylan Bozoğullarından - Backend Dev. (Python)"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        onTap: () => launch(
                            "https://www.linkedin.com/in/ceylanb/?originalSubdomain=tr"),
                        child: Image.asset(
                          "assets/images/linked-in.png",
                          height: 20,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        child: GestureDetector(
                          onTap: () => launch("https://github.com/ceylanb"),
                          child: Image.asset(
                            "assets/images/github-logo.png",
                            height: 25,
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Dil - Framework",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 55,
                          child: Image.asset(
                            "assets/images/python-square-2.png",
                            height: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Python",
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 55,
                          child: Image.asset(
                            "assets/images/flutter-square-2.png",
                            height: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Flutter",
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 55,
                          child: Image.asset(
                            "assets/images/dart-square-2.png",
                            height: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Dart",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
