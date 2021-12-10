import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          ExpansionTile(
            leading: Image(image: AssetImage("assets/img_iconrock.png")),
            childrenPadding: const EdgeInsets.only(left: 50.0, top: 20),
            title: Text(
              "Rock",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Lets Rock the world",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
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
            leading: Image(image: AssetImage("assets/img_icon_jazz.png")),
            title: Text(
              "Jazz",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Its so Jazzy in nature",
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
            leading: Image(image: AssetImage("assets/img_icontimeless.png")),
            title: Text(
              "Timeless",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Some things never gets old",
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
            leading: Image(image: AssetImage("assets/img_iconclassic.png")),
            title: Text(
              "Classic",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Its pure,its classic",
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
            leading: Image(image: AssetImage("assets/item_Country.png")),
            title: Text(
              "Country",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Lets it Play",
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
