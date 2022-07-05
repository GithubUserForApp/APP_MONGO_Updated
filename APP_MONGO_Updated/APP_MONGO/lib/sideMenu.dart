import 'package:flutter/material.dart';
import 'tabsPage.dart';
import 'raise_issue.dart';
import 'contact.dart';
import 'publish_opportunity.dart';
import 'admin_login.dart';
import 'faq.dart';
import 'about.dart';
import 'alumni.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF0091DE),
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 45.0,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/msc_logo.png'),
                    radius: 40.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "MATA SUNDRI COLLEGE FOR WOMEN",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "University of Delhi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => tabsPage(selectedIndex: 0)),
              ),
            },
            title: Text(
              'HOME PAGE',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => tabsPage(selectedIndex: 1)),
              ),
            },
            title: Text(
              'SOCITIES',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.people),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => tabsPage(selectedIndex: 2)),
              ),
            },
            title: Text(
              'EVENT HIGHLIGHT',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.highlight),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RaiseIssue()),
              )
            },
            title: Text(
              'RAISE AN ISSUE',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.headset_mic),
          ),
          /*ListTile(
            onTap: _launchURL,
            title: Text(
              'VISIT OUR WEBSITE',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.web),
          ),*/
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Publish()),
              )
            },
            title: Text(
              'PUBLISH OPPORTUNITY',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.home),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              )
            },
            title: Text(
              'ADMIN LOGIN',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.login),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Faq()),
              )
            },
            title: Text(
              'FAQ\'s',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.help),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ContactUs()),
              )
            },
            title: Text(
              'CONTACT US',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.call),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Alumni()),
              )
            },
            title: Text(
              'ALUMNI',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.school),
          ),
          ListTile(
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => About()),
              )
            },
            title: Text(
              'ABOUT US',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            leading: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}

/*_launchURL() async {
  const url = 'https://mscw.ac.in/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/
