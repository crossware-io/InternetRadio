import 'package:flutter/material.dart';
import 'Categories.dart';
import 'dart:io';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool togglekey = false;
  int stationCount = 0;
  String stationName = "Select Station";
  String stationsource = "";
  String programme = "No station is selected";
  String bgTheme = "assets/img_bgTheme01.png";
  double _width = 0;
  double _height = 0;
  double _widthFade = 0;
  double _heightFade = 0;

  function(value) {
    setState(() {
      _width = 0;
      _height = 0;
      stationCount = value;
      setStation();
    });
  }

  animateImg() {
    setState(() {
      _width = 600;
      _height = 70;
      _heightFade = 260;
      _widthFade = 400;
    });
  }

  double opacityLevel = 0.0;
  double _opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
      _opacityLevel = _opacityLevel == 1 ? 0.0 : 1.0;
    });
  }

  setStation() {
    switch (stationCount) {
      case 1:
        stationName = "WDR 4 Radio";
        stationsource = "https://mp3channels.webradio.antenne.de/antenne";
        programme = "WDR 4";
        togglekey = true;
        animateImg();
        break;
      case 2:
        stationName = "BBC Radio";
        stationsource = "http://stream.live.vc.bbcmedia.co.uk/bbc_radio_one";
        programme = "BBC Radio One";
        togglekey = true;
        animateImg();
        break;
      default:
    }
    _changeOpacity();
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  functionbgImage(bgImage) {
    setState(
      () => bgTheme = bgImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Container(
        height: 480,
        width: 800,
        child: Stack(children: <Widget>[
          Image(
            height: 480,
            width: 800,
            image: AssetImage(bgTheme),
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 30, right: 50),
            child: Container(
              width: 800,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        width: _width,
                        height: _height,
                        duration: const Duration(milliseconds: 2000),
                        child: Text(
                          "Now Playing",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 55,
                              color: Colors.white),
                        ),
                        curve: Curves.fastOutSlowIn,
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          iconSize: 50,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return Categories(
                                      funcCatagory: function,
                                      funcCatagorybgImg: functionbgImage,
                                    );
                                  },
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
                                    return SlideTransition(
                                      position: new Tween<Offset>(
                                        begin: const Offset(1.0, 0.0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: new SlideTransition(
                                        position: new Tween<Offset>(
                                          begin: Offset.zero,
                                          end: const Offset(-1.0, 0.0),
                                        ).animate(secondaryAnimation),
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                      Duration(milliseconds: 500)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                      child: Container(
                          height: 2,
                          width: 800,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.green, Colors.blue])))),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 50,
            child: Container(
              width: 250,
              height: 370,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: "Station",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white60),
                        children: <TextSpan>[
                          TextSpan(
                            text: "\n " + stationName,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      text: TextSpan(
                        text: "Programme",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.normal,
                            color: Colors.white60),
                        children: <TextSpan>[
                          TextSpan(
                              text: "\n" + programme,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  ActionButton(),
                ],
              ),
            ),
          ),
          Positioned(
              left: 270,
              top: 130,
              child: Stack(children: <Widget>[
                Opacity(
                  opacity: _opacityLevel,
                  child: Container(
                    height: 300,
                    width: 520,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (stationCount == 2) {
                                stationCount = 1;
                                setStation();
				Process.run('radio_test.sh', ['101'])
                                   .then((ProcessResult rs) {
                                   print(rs.exitCode);
                                   print(rs.stdout);
                                   print(rs.stderr);
                                });	
                              }
                            });
                          },
                          icon: Icon(Icons.chevron_left),
                          color: Colors.white,
                          iconSize: 40,
                        ),
                        Container(
                          width: 400,
                          height: 260,
                          child: Image(
                              height: _heightFade,
                              width: _widthFade,
                              image: AssetImage("assets/img_albumart.png")),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (stationCount == 1) {
                                stationCount = 2;
                                setStation();
				Process.run('radio_test.sh', ['102'])
                                   .then((ProcessResult rs) {
                                   print(rs.exitCode);
                                   print(rs.stdout);
                                   print(rs.stderr);
                                });	
                              }
                            });
                          },
                          icon: Icon(Icons.chevron_right),
                          color: Colors.white,
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: opacityLevel,
                  duration: const Duration(seconds: 3),
                  child: Container(
                    height: 300,
                    width: 520,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (stationCount == 2) {
                                stationCount = 1;
                                setStation();
                              }
                            });
                          },
                          icon: Icon(Icons.chevron_left),
                          color: Colors.white,
                          iconSize: 40,
                        ),
                        Container(
                          width: 400,
                          height: 260,
                          child: FadeTransition(
                            opacity: _animation,
                            child: Image(
                                height: _heightFade,
                                width: _widthFade,
                                image: AssetImage("assets/img_albumart.png")),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (stationCount == 1) {
                                stationCount = 2;
                                setStation();
                              }
                            });
                          },
                          icon: Icon(Icons.chevron_right),
                          color: Colors.white,
                          iconSize: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ]))
        ]),
      )),
    );
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  // On-pressed stop button
                  print("Stop");
                  // call script
                  Process.run('radio_test.sh', ['500'])
                      .then((ProcessResult rs) {
                    print(rs.exitCode);
                    print(rs.stdout);
                    print(rs.stderr);
                  });
                },
                child: Text(
                  " Stop  ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green[800],
                )),
            Row(children: <Widget>[
              Icon(
                Icons.volume_mute,
                color: Colors.white,
                size: 20,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  valueIndicatorColor: Colors.transparent,
                  inactiveTrackColor: Colors.black26,
                  activeTrackColor: Colors.lightGreen,
                  thumbColor: Colors.lightGreen,
                  overlayColor: Colors.black12,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
                  trackHeight: 8,
                ),
                child: Slider(
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                    //on slider value changed
                    value *= 100;
                    int test = value.round();
                    print(test);
                    Process.run('radio_test.sh', [test.toString()])
                        .then((ProcessResult rs) {
                      print(rs.exitCode);
                      print(rs.stdout);
                      print(rs.stderr);
                    });
                    print(value);
                  },
                  label: sliderValue.round().toString(),
                  min: 0.0,
                  max: 1.0,
                  // divisions: 10,
                ),
              ),
              Icon(
                Icons.volume_up_rounded,
                color: Colors.white,
                size: 20,
              ),
            ])
          ]),
    );
  }
}
