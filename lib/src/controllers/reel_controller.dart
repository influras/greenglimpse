import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/reel_creator_model.dart';

class ReelController extends ChangeNotifier {
  List<String> thumbnailUrlList = [];
  Future<ReelsModel> getShortsData() async {
    final response = await rootBundle.loadString('assets/sample.json');
    final responseData = await json.decode(response);

    //final response = await http.get(
    //  Uri.parse('https://internship-service.onrender.com/videos?page=2'));
    //var responseData = jsonDecode(response.body.toString());

    List<String> tempList = [];
    if (response.isNotEmpty) {
      for (int index = 0; index < 5; index++) {
        tempList.add(ReelsModel.fromJson(responseData)
            .data
            .posts[index]
            .submission
            .toString());
      }
    } else {
      throw Exception('Failed to load');
    }
    thumbnailUrlList = tempList;
    return ReelsModel.fromJson(responseData);
  }
}
