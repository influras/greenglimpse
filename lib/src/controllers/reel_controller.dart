import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/reel_model.dart';

class ReelController extends ChangeNotifier {
  List<Reels> reelsList = [];
  Future<ReelsModel> getReelsData() async {
    final response = await rootBundle.loadString('assets/sample.json');
    final responseData = await json.decode(response);
    List<Reels> list = [];
    if (response.isNotEmpty) {
      for (int index = 0; index < 5; index++) {
        list.add(Reels.fromJson(responseData));
      }
    } else {
      throw Exception('Failed to load');
    }
    reelsList = list;
    return ReelsModel.fromJson(responseData);
  }

  List<Reels> getReels() {
    getReelsData();
    List<Reels> reList = reelsList;
    print(reList);
    print(reelsList);

    return reList;
  }
}
