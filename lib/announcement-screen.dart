import 'package:eruduyuru/data-helpers.dart';
import 'package:eruduyuru/settings-page-ui.dart';
import 'package:flutter/material.dart';
import 'home-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Duyuru> duyurular = [];
  String department;

  Future<List<Duyuru>> duyuruDoldur() {
    print("Test0");
    var duyuru = DataOperations().duyurulariGetir();
    return duyuru;
  }

  getDepartment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    department = prefs.getString("selectedDepartment");
  }

  @override
  Widget build(BuildContext context) {
    getDepartment();
    return Theme(
      data: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0)),
      ),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text("Eru Duyurular"),
          leading: Container(
            margin: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/erulogoduyuru.png"),
              backgroundColor: Colors.black,
            ),
          ),
          iconTheme: IconThemeData(
            size: 5,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings,color: Colors.white,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPage(),
                  ),
                );
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: duyuruDoldur(),
            builder: (context, sonuc) {
              if (sonuc.hasData) {
                debugPrint("sonuc.hasData = true");
                duyurular = sonuc.data;
                debugPrint("Duyuru 0 = " + duyurular[0].title);
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: duyurular.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(64, 75, 96, .9)),
                        child: ListTile(
                            onTap: () {
                              String id = duyurular[index].id;
                              launch(
                                  'https://$department.erciyes.edu.tr/?DuyuruID=$id');
                            },
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(
                                  border: new Border(
                                      right: new BorderSide(
                                          width: 1.0, color: Colors.white24))),
                              child: Icon(Icons.notifications_active,
                                  color: Colors.white),
                            ),
                            title: Text(
                              duyurular[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            // subtitle: Text("10.07.2020", style: TextStyle(color: Colors.white)),

                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.linear_scale,
                                    color: Colors.yellowAccent),
                                Text(" " + duyurular[index].date,
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 30.0)),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
