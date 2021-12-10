// class AppData {
//   static final AppData _appData = new AppData._internal();

//   String bgtheme = "assets/img_bgTheme01.png";
//   String station = "Select Staion";
//   String stationSource = "";

//   factory AppData() {
//     return _appData;
//   }

//   getbgtheme() {
//     print(bgtheme);

//     return bgtheme;
//   }

//   AppData._internal();
// }

// final appData = AppData();

class SingletonTwo {
  String bgtheme = "assets/img_bgTheme01.png";
  String station = "Select Staion";
  String stationSource = "";

  SingletonTwo._privateConstructor();

  static final SingletonTwo _instance = SingletonTwo._privateConstructor();

  static SingletonTwo get instance {
    return _instance;
  }
}
