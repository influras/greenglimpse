import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/reel_model.dart';
import 'package:flutter/services.dart' as root_bundle;

class ReelController extends ChangeNotifier {
  Future<List<Reels>> getReelsData() async {
    final response =
        await ReadJsonFile.readJsonData(path: "assets/sample.json");
    final responseData = response['reels'] as List<dynamic>;

    List<Reels> list = [];

    if (responseData.isNotEmpty) {
      for (int index = 0; index < responseData.length; index++) {
        list.add(Reels.fromJson(responseData[index]));
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
