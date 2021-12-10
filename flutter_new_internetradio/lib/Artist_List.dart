import 'package:flutter/material.dart';

class Artist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ExpansionTile(
            leading: Image(image: AssetImage("assets/Img_Icon02.png")),
            title: Text(
              "Ben Howard",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Sample Text",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            childrenPadding: const EdgeInsets.only(left: 50.0, top: 10),
            children: <Widget>[
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
                ),
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
                ),
              )
            ],
          ),
          Divider(
            height: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.white70,
            thickness: 0.3,
          ),
          ExpansionTile(
            leading: Image(image: AssetImage("assets/Img_Icon02.png")),
            title: Text(
              "Lianne La Havas",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Sample Text",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.white70,
            thickness: 0.3,
          ),
          ExpansionTile(
            leading: Image(image: AssetImage("assets/Img_Icon02.png")),
            title: Text(
              "Zaz",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Sample Text",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.white70,
            thickness: 0.3,
          ),
          ExpansionTile(
            leading: Image(image: AssetImage("assets/Img_Icon02.png")),
            title: Text(
              "Robyn",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Sample Text",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.white70,
            thickness: 0.3,
          ),
          ExpansionTile(
            leading: Image(image: AssetImage("assets/Img_Icon02.png")),
            title: Text(
              "Ed Sheeran",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Sample Text",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
          ),
          Divider(
            height: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.white70,
            thickness: 0.3,
          ),
        ],
      ),
    );
  }
}
