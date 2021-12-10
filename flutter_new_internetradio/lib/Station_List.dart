import 'package:flutter/material.dart';
import 'Categories.dart';
import 'dart:io';

class StationList extends StatefulWidget {
  final Function func;

  const StationList({Key? key, required this.func}) : super(key: key);

  @override
  _StationList createState() => _StationList(func);
}

class _StationList extends State<StationList> {
  Function func;
  _StationList(this.func);
  int _visible = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: ListView(
            children: [
              ListTile(
                leading: Image(
                    image: AssetImage("assets/img_radioicon01_364_16.png")),
                title: Text(
                  "WDR 4 Radio",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  "Sample Text",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
                trailing: Visibility(
                  visible: _visible == 1 ? true : false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                          image: AssetImage(
                              "assets/img_nowplayingbutton_364_29.png")),
                      Text(
                        "Now Playing",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 8),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  // setState(() {
                  //   _visible = 1;
                  // });
                  func(1);
                  // func("WDR 4 Radio",
                  //     "https://mp3channels.webradio.antenne.de/antenne"); // passing data to parent
                  Process.run('radio_test.sh', ['101'])
                      .then((ProcessResult rs) {
                         print(rs.exitCode);
                         print(rs.stdout);
                         print(rs.stderr);
                  });
		  Navigator.pop(context);
                  print(_visible);
                },
              ),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white70,
                thickness: 0.3,
              ),
              ListTile(
                leading: Image(
                    image: AssetImage("assets/img_radioicon02_364_17.png")),
                title: Text(
                  "BBC Radio",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                subtitle: Text(
                  "Sample Text",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
                trailing: Visibility(
                  visible: _visible == 2 ? true : false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                          image: AssetImage(
                              "assets/img_nowplayingbutton_364_29.png")),
                      Text(
                        "Now Playing",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 8),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  // setState(() {
                  //   _visible = 2;
                  // });
                  func(2);
                  // func("BBC Radio",
                  //     "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one"); // passing data to parent
                  Process.run('radio_test.sh', ['102'])
                      .then((ProcessResult rs) {
                         print(rs.exitCode);
                         print(rs.stdout);
                         print(rs.stderr);
                  });
                  Navigator.pop(context);
                  print(_visible);
                },
              ),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white70,
                thickness: 0.3,
              ),
              ListTile(
                  leading: Image(
                      image: AssetImage("assets/img_radioicon03_364_41.png")),
                  title: Text(
                    "BBC Radio 4 Extra",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Text(
                    "Sample Text",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  )),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white70,
                thickness: 0.3,
              ),
              ListTile(
                  leading: Image(
                      image: AssetImage("assets/img_radioicon04_364_35.png")),
                  title: Text(
                    "Radio FM 4",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Text(
                    "Sample Text",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  )),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white70,
                thickness: 0.3,
              ),
              ListTile(
                  leading: Image(
                      image: AssetImage("assets/img_radioicon05_364_15.png")),
                  title: Text(
                    "Radio FM 5",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Text(
                    "Sample Text",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Colors.white),
                  )),
              Divider(
                height: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.white70,
                thickness: 0.3,
              ),
            ],
          ),
        ));
  }

  // get_Source(test_Source) {
  //   String test_Source = "";
  //   StreamBuilder<PlayerState>(
  //       stream: player.playerStateStream,
  //       builder: (context, snapshot) {
  //         final playerState = snapshot.data;
  //         final processingState = playerState?.processingState;
  //         final playing = playerState?.playing;
  //         if (processingState == ProcessingState.loading ||
  //             processingState == ProcessingState.buffering) {
  //           return Container();
  //         } else if (processingState != ProcessingState.completed) {
  //           player.play;
  //         }
  //       });
  // }
}
