import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/reel_model.dart';
import 'package:flutter/services.dart' as root_bundle;

class ReelController extends ChangeNotifier {
  List<Reels> getReelsData() {
    final response =
        ReadJsonFile.readJsonData(path: "assets/sample.json").then((value) {});
    final responseData = json.decode(response.toString());
    List<Reels> list = [];
    if (responseData.isNotEmpty) {
      for (int index = 0; index < 5; index++) {
        list.add(ReelsModel.fromJson(responseData).reels as Reels);
        print(list);
      }
    } else {
      throw Exception('Failed to load');
    }

    return list;
  }
}

class ReadJsonFile {
  static Future<Map> readJsonData({required String path}) async {
    // read json file
    final jsondata = await root_bundle.rootBundle.loadString(path);

    // decode json data as list
    final list = json.decode(jsondata) as Map<String, dynamic>;

    // map json and initialize
    // using DataModel
    return list;
  }
}
