// ignore_for_file: must_be_immutable

import '../controllers/reel_controller.dart';
import 'package:greenglimpse/src/models/reel_creator_model.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greenglimpse/src/widgets/shorts_player_widget.dart';

class ReelsMainView extends StatefulWidget {
  final List<Reel> postDetails;

  const ReelsMainView({Key? key, required this.postDetails}) : super(key: key);

  @override
  State<ReelsMainView> createState() => _ReelsMainViewState();
}

class _ReelsMainViewState extends State<ReelsMainView> {
  @override
  void initState() {
    super.initState();
    ReelController().getShortsData();
  }

  Color likeBtnColor = Colors.white,
      dislikeBtnColor = Colors.white,
      subscribeBtnColor = Colors.red;
  double iconSize = 33;
  TextStyle textStyle1 = const TextStyle(
    color: Colors.white,
    fontSize: 15,
  );
  bool likeBtnSwitch = false, dislikeBtnSwitch = false, subscribeSwitch = false;
  String subscribeText = 'Subscribe';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (widget.postDetails.isNotEmpty)
          ? Scaffold(
              body: PageView.builder(
                //to make the whole page scrollable
                itemCount: 10,
                controller: PageController(initialPage: 0, viewportFraction: 1),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Stack(
                    //to put all other elements on top of the video
                    children: [
                      ShortsPlayer(
                        shortsUrl: widget.postDetails[index].mediaUrl,
                      ),

                      //all stacked options
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //upper options row
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // back-arrow + shorts-heading row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    'Shorts',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //lower-operations row
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                //video content details
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        widget.postDetails[index].title
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            )
          : const Center(
              child: SpinKitSpinningLines(
                color: Colors.greenAccent,
                size: 200,
                lineWidth: 3,
              ),
            ),
    );
  }
}
