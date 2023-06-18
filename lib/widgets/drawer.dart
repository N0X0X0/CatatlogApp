import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://pps.whatsapp.net/v/t61.24694-24/322992085_3453917004886871_3044115641184272761_n.jpg?ccb=11-4&oh=01_AdRTIok2ncwFtpBwmLAl4AHvBS5JDbEhuYJcJ_xwyVQtbg&oe=64001891";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Ayush Anand",
                    textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  accountEmail: Text("ayush.anand2123@gmail.com",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,
              color: Colors.white,
              ),
              title: Text("Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Contact",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
