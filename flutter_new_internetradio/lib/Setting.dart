import 'package:flutter/material.dart';
import 'Singleton.dart';

class SettingPage extends StatefulWidget {
  final Function funcSetting;
  final Function funcSettingBg;

  const SettingPage(
      {Key? key, required this.funcSetting, required this.funcSettingBg})
      : super(key: key);
  @override
  _SettingPageState createState() =>
      _SettingPageState(funcSetting, funcSettingBg);
}

class _SettingPageState extends State<SettingPage> {
  double _currentBrightnessValue = 75;
  int selectImg = 1;
  Function funcSetting;
  Function funcSettingBg;

  _SettingPageState(this.funcSetting, this.funcSettingBg);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Container(
        // color: Colors.black45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Brightness",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.white)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 20,
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      valueIndicatorColor: Colors.deepOrange,
                      inactiveTrackColor: Colors.black26,
                      // Custom Gray Color
                      activeTrackColor: Colors.lightGreen,
                      thumbColor: Colors.lightGreen,
                      overlayColor: Colors.black12,
                      // Custom Thumb overlay Color
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                      trackHeight: 8,
                    ),
                    child: Slider(
                      value: _currentBrightnessValue,
                      onChanged: (double value) {
                        setState(() {
                          _currentBrightnessValue = value;
                        });
                      },
                      min: 0.0,
                      max: 100.0,
                    ),
                  ),
                ),
                Icon(
                  Icons.brightness_7,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
            Text("Background Themes",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: Colors.white)),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        funcSetting("assets/theme01.png");
                        funcSettingBg("assets/theme01.png");
                        SingletonTwo.instance.bgtheme = "assets/theme01.png";
                        //Navigator.pop(context);
                      },
                      child:
                          Image(image: AssetImage("assets/img_theme01.png"))),
                  GestureDetector(
                      onTap: () {
                        funcSetting("assets/theme02.png");
                        funcSettingBg("assets/theme02.png");
                        SingletonTwo.instance.bgtheme = "assets/theme02.png";
                        //Navigator.pop(context);
                      },
                      child:
                          Image(image: AssetImage("assets/img_theme02.png"))),
                  GestureDetector(
                      onTap: () {
                        funcSetting("assets/theme03.png");
                        funcSettingBg("assets/theme03.png");
                        SingletonTwo.instance.bgtheme = "assets/theme03.png";
                        //Navigator.pop(context);
                      },
                      child:
                          Image(image: AssetImage("assets/img_theme03.png"))),
                  GestureDetector(
                      onTap: () {
                        funcSetting("assets/theme04.png"); //HomeScreen
                        funcSettingBg("assets/theme04.png"); //Categories
                        SingletonTwo.instance.bgtheme =
                            "assets/theme04.png"; //Not to reset value again
                        //Navigator.pop(context);
                        print("SeetingPage" + SingletonTwo.instance.bgtheme);
                      },
                      child:
                          Image(image: AssetImage("assets/img_theme04.png"))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
