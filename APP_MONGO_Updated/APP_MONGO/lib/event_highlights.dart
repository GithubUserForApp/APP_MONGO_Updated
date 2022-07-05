import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'event1.dart';
import 'event2.dart';
import 'CentralEvents.dart';

class EventH extends StatefulWidget {
  _EventHState createState() => _EventHState();
}

class _EventHState extends State<EventH> {
  final pageViewController = PageController();

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Events");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: cusIcon,
            onPressed: () {
              {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: Search());
              }
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  // this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Events",
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("Events");
                }
              });
            },
          )
        ],
        title: cusSearchBar,
        backgroundColor: Color(0xFF0091DE),
        centerTitle: true,
      ),
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn5',
        onPressed: () {},
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/chatbot.jpg'), fit: BoxFit.fill),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFFFFF),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: [
                      PageView(
                        scrollDirection: Axis.horizontal,
                        controller: pageViewController,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNHj6bYl76vYBHtWJpXFrHYEDk6u_J3ZAXw&usqp=CAUhttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlNHj6bYl76vYBHtWJpXFrHYEDk6u_J3ZAXw&usqp=CAU',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://picsum.photos/250?image=5%27',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://picsum.photos/250?image=5%27',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://picsum.photos/250?image=9%27',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://picsum.photos/250?image=2%27',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          hintText: 'Search Events',
                          hintStyle: TextStyle(
                            color: Color(0xFF525252),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  color: Color(0xFFFFBA15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Central Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new InkWell(
                          child: new Text('More'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFF720972),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new InkWell(
                                child: new Text(
                                  '     Peer Mentorship \n    program',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Event1()));
                                },
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xFF720972),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new InkWell(
                                child: new Text(
                                  '    Un-Lock benefits of \n    LinkedIn',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Event2()));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 12.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customButton(
                              'Pride makeup\nCompetition', Color(0xFF720972),
                              () {
                            navigate(context, 'event1');
                          }),
                          customButton(
                              'Behavioral Biometric', Color(0xFF720972), () {
                            navigate(context, 'event2');
                          }),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 12.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  color: Color(0xFFFFBA15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Department Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new InkWell(
                          child: new Text('More'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event2()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customButton('Meme Fest', Color(0xFF720972), () {
                            navigate(context, 'event1');
                          }),
                          customButton('Fit India Movement', Color(0xFF720972),
                              () {
                            navigate(context, 'event2');
                          }),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 12.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customButton(
                              'International \nYoga Day', Color(0xFF720972),
                              () {
                            navigate(context, 'event1');
                          }),
                          customButton(
                              'Tree for the \nFuture', Color(0xFF720972), () {
                            navigate(context, 'event2');
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate<String> {
  String got = "";
  final eventsinclg = [
    "Peer Mentorship Program",
    "Un-lock benefits of Likedln",
    "Pride Makeup Competition",
    "Behavioral Biometric",
    "Meme Fest",
    "Fit India Movement",
    "International Yoga Day",
    "Tree for the future"
  ];

  final recentsrch = [
    "Webinar on mental health",
    "TEDx event",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ]; //removes anything registered within the search bar
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on app bar on left side
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // when selected show results based on selections
    if (eventsinclg.indexOf(got) == 0) {
      //setState method before the build method had completed the process of building the widgets.
      //error occurs while showing widget before the completion of the build method,
      //so we use schedulerbinding
      Future.delayed(Duration.zero, () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Event1()),
        );
      });
    } else if (eventsinclg.indexOf(got) == 1) {
      Future.delayed(Duration.zero, () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Event2()),
        );
      });
    } else {
      return Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: (MediaQuery.of(context).size.width) - 20, //screen width -20
        child: Card(
            color: Colors.blue,
            child: Center(
              child: Text(got),
            )),
      );
    }
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show relevant things when someone searches
    //-->query is a property that represents entered text by user
    final suggestionList = query.isEmpty
        ? recentsrch
        : eventsinclg
            .where((str) => str.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
          //what happens when we click suggested search
          onTap: () {
            got = suggestionList[index];

            showResults(context);
          },
          leading: Icon(Icons.arrow_right),
          title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.normal))
                ]),
          )),
      itemCount: suggestionList.length,
    );
  }
}
