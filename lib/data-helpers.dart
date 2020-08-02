import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Duyuru {
  String id;
  String date;
  String title;

  Duyuru({this.id, this.date, this.title});

  factory Duyuru.fromJson(Map<String, dynamic> test) {
    return Duyuru(
      id: test['id'],
      date: test['tarih'],
      title: test['baslik'],
    );
  }
}

class DataOperations {
  String subUrl =
      "https://raw.githubusercontent.com/mtyuksel/erciyes_duyuru/master/";

  Future<List<Duyuru>> duyurulariGetir() async {
    List<Duyuru> _duyurular = await parseData();
    return _duyurular;
  }

  Future<List<Duyuru>> parseData() async {
    List<Duyuru> _duyuru;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String department = prefs.getString("selectedDepartment");

    String requestUrl = subUrl + "$department.json";
    print(requestUrl);
    debugPrint("before request");
    http.Response response = await getJson(requestUrl);
    debugPrint("after request");
    if (response.statusCode == 200) {
      debugPrint("response.statusCode = 200");
      _duyuru = duyurulariListele(response.body);
      return _duyuru;
    } else {
      debugPrint("response.statusCode != 200");
      throw Exception('Duyurular Getirilemedi!');
    }
  }

  Future<http.Response> getJson(requestUrl) {
    debugPrint("http.get(requestUrl)");
    return http.get(requestUrl);
  }

  List<Duyuru> duyurulariListele(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Duyuru> duyurular =
        parsed.map<Duyuru>((json) => Duyuru.fromJson(json)).toList();
    return duyurular;
  }
}
