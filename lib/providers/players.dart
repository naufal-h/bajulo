import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:bajulo/model/player.dart';

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(
      String name, String position, String image, BuildContext context) {
    DateTime datetimeNow = DateTime.now();
    Uri url = Uri.parse(
        "https://tugas-46-47-pmobteo-default-rtdb.firebaseio.com/playes.json");
    return http
        .post(url,
            body: json.encode({
              "name": name,
              "position": position,
              "imageUrl": image,
              "createdAt": datetimeNow.toString(),
            }))
        .then((response) {
      _allPlayer.add(
        Player(
          id: json.decode(response.body)["name"].toString(),
          name: name,
          position: position,
          imageUrl: image,
          createdAt: datetimeNow,
        ),
      );
      notifyListeners();
    });
  }

  Future<void> editPlayer(
      String id, String name, String position, String image) {
    DateTime datetimeNow = DateTime.now();
    Uri url = Uri.parse(
        "https://tugas-46-47-pmobteo-default-rtdb.firebaseio.com/playes/$id.json");
    return http
        .put(url,
            body: json.encode({
              "name": name,
              "position": position,
              "imageUrl": image,
              "createdAt": datetimeNow.toString(),
            }))
        .then((response) {
      Player selectPlayer =
          _allPlayer.firstWhere((element) => element.id == id);
      selectPlayer.name = name;
      selectPlayer.position = position;
      selectPlayer.imageUrl = image;
      notifyListeners();
    });
  }

  Future<void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://tugas-46-47-pmobteo-default-rtdb.firebaseio.com/playes/$id.json");
    return http
        .delete(
      url,
    )
        .then((response) {
      _allPlayer.removeWhere((element) => element.id == id);

      notifyListeners();
    });
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://tugas-46-47-pmobteo-default-rtdb.firebaseio.com/playes.json");
        
    //menggunakna await agar dapat return tanpa "return" dan menggunakan async di functionnya
    var hasilGetData= await http.get(url);
    var dataResponse=json.decode(hasilGetData.body) as Map<String,dynamic>;
      dataResponse.forEach((key, value) {
        DateTime datetimeParse=DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _allPlayer.add(
          Player(
            id:key,
            createdAt: datetimeParse,
            imageUrl: value["imageUrl"],
            name: value["name"],
            position: value["position"],
          )
        );
      });

    notifyListeners();
  }
}
