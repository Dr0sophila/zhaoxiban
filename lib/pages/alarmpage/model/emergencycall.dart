import 'package:flutter/material.dart';
import 'package:flutter_slide_done/slide_done.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class EmergencyCall extends StatelessWidget {
  String mode;
  EmergencyCall(this.mode, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    mode,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  width: double.infinity,
                  height: 0.5,
                  color: Colors.grey,
                ),
                SlideDone(
                  width: 250.0,
                  height: 60.0,
                  padding: 3.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  buttonShape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(20.0 - 3.0))),
                  startIcon: Image(
                    image: AssetImage("assets/img/$mode.png"),
                  ),
                  startText: const Text(
                    "右滑报警 > > >",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  startingText: const Text(
                    "拨通中",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  startedText: const Text(
                    " ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  endText: const Text(
                    " ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  endingText: const Text(
                    " ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  endedText: const Text(
                    " ",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  startFillView: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.lens,
                          size: 10.0,
                        ),
                        Container(
                          width: 10.0,
                        ),
                        const Icon(
                          Icons.lens,
                          size: 10.0,
                        ),
                        Container(
                          width: 10.0,
                        ),
                        const Icon(
                          Icons.lens,
                          size: 10.0,
                        ),
                        Container(
                          width: 10.0,
                        ),
                        const Icon(
                          Icons.lens,
                          size: 10.0,
                        ),
                      ],
                    ),
                  ),
                  onEnd: () async {
                    launch("tel:$mode");

                    Navigator.pop(context);
                  },
                ),
              ],
            )));
  }
}
