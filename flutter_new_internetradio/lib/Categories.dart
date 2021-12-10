import 'package:flutter/material.dart';
import 'Station_List.dart';
import 'Genre_List.dart';
import 'Cities_List.dart';
import 'Artist_List.dart';
import 'Setting.dart';
import 'Singleton.dart';

class Categories extends StatefulWidget {
  final Function funcCatagory;
  final Function funcCatagorybgImg;

  const Categories(
      {Key? key, required this.funcCatagory, required this.funcCatagorybgImg})
      : super(key: key);
  @override
  _CategoriesState createState() =>
      _CategoriesState(funcCatagory, funcCatagorybgImg);
}

class _CategoriesState extends State<Categories> {
  bool colortoggle = true;
  bool colortoggle2 = false;
  bool colortoggle3 = false;
  bool colortoggle4 = false;
  bool colortoggle5 = false;
  int widgetNumber = 1;

  String bgImageCT = SingletonTwo.instance.bgtheme;

  Function funcCatagory;

  Function funcCatagorybgImg;

  setbgImage(value) {
    setState(
      () => bgImageCT = value,
    );
  }

  _CategoriesState(this.funcCatagory, this.funcCatagorybgImg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          height: 480,
          width: 800,
          child: Stack(children: <Widget>[
            Image(height: 480, width: 800, image: AssetImage(bgImageCT)),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 30, right: 50),
              child: Container(
                width: 800,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            child: Text(
                          "Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 55,
                              color: Colors.white),
                        )),
                        Container(
                          child: IconButton(
                            icon:
                                Image.asset("assets/img_backnormal_364_26.png"),
                            iconSize: 50,
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
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
                left: 50,
                top: 120,
                child: Container(
                  // color: Colors.black12,
                  width: 200,
                  height: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 50,
                        color: colortoggle
                            ? Colors.lightGreenAccent[700]
                            : Colors.transparent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                widgetNumber = 1;
                                colortoggle = true;
                                colortoggle2 = colortoggle3 =
                                    colortoggle4 = colortoggle5 = false;
                              });
                            },
                            child: Text(
                              "Stations (11)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        color: colortoggle2
                            ? Colors.lightGreenAccent[700]
                            : Colors.transparent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                widgetNumber = 2;
                                colortoggle2 = true;
                                colortoggle = colortoggle3 =
                                    colortoggle4 = colortoggle5 = false;
                              });
                            },
                            child: Text(
                              "Genre (05)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        color: colortoggle3
                            ? Colors.lightGreenAccent[700]
                            : Colors.transparent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                widgetNumber = 3;
                                colortoggle3 = true;
                                colortoggle2 = colortoggle =
                                    colortoggle4 = colortoggle5 = false;
                              });
                            },
                            child: Text(
                              "Cities (03)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        color: colortoggle4
                            ? Colors.lightGreenAccent[700]
                            : Colors.transparent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                widgetNumber = 4;
                                colortoggle4 = true;
                                colortoggle2 = colortoggle3 =
                                    colortoggle = colortoggle5 = false;
                              });
                            },
                            child: Text(
                              "Artists (09)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            )),
                      ),
                      Container(
                        width: 200,
                        height: 50,
                        color: colortoggle5
                            ? Colors.lightGreenAccent[700]
                            : Colors.transparent,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                widgetNumber = 5;
                                colortoggle5 = true;
                                colortoggle2 = colortoggle3 =
                                    colortoggle4 = colortoggle = false;
                              });
                            },
                            child: Text(
                              "Settings",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                )),
            Positioned(
              left: 250,
              top: 120,
              child: Image(
                  image: AssetImage("assets/img_partitionline_364_24.png")),
            ),
            Positioned(
                left: 300,
                top: 120,
                child: Container(
                  width: 450,
                  height: 350,
                  //color: Colors.white12,
                  child: getwidgets(),
                ))
          ]),
        ),
      ),
    );
  }

  getwidgets() {
    switch (widgetNumber) {
      case 1:
        return StationList(
          func: funcCatagory,
        );
      case 2:
        return Genre();
      case 3:
        return Cities();
      case 4:
        return Artist();
      case 5:
        return SettingPage(
            funcSetting: funcCatagorybgImg, funcSettingBg: setbgImage);
    }
  }
}
