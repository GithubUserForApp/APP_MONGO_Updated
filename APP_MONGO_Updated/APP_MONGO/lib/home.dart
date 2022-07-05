import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'sideMenu.dart';
import 'event1.dart';
import 'event2.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageViewController = PageController();
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("MSCW");
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
              // setState(() {
              //   if (this.cusIcon.icon == Icons.search) {
              //     this.cusIcon = Icon(Icons.cancel);
              //     this.cusSearchBar = TextField(
              //       textInputAction: TextInputAction.go,
              //       decoration: InputDecoration(
              //         border: InputBorder.none,
              //         hintText: "Search",
              //       ),
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 16.0,
              //       ),
              //     );
              //   } else {
              //     this.cusIcon = Icon(Icons.search);
              //     this.cusSearchBar = Text("MSCW");
              //   }
              // });

              showSearch(context: context, delegate: Search());
            },
          )
        ],
        title: cusSearchBar,
        backgroundColor: Color(0xFF0091DE),
        centerTitle: true,
      ),
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn9',
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
              SizedBox(
                height: 10.0,
              ),
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
                          SizedBox(
                            height: 200.0,
                            width: 500.0,
                            child: Carousel(
                              images: [
                                Image.asset('images/clg1.png'),
                                Image.asset('images/clg2.png'),
                                Image.asset('images/clg3.png'),
                                Image.asset('images/clg4.png'),
                              ],
                              boxFit: BoxFit.fill,
                              autoplay: true,
                              animationCurve: Curves.fastOutSlowIn,
                              animationDuration: Duration(milliseconds: 2000),
                              dotSize: 4.0,
                              dotColor: Colors.white,
                              dotBgColor: Colors.transparent,
                              dotPosition: DotPosition.bottomCenter,
                              dotVerticalPadding: 20.0,
                              showIndicator: true,
                              indicatorBgPadding: 6.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF720972),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "UPCOMING EVENTS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      addEvent(context),
                      addEvent1(context),
                      addEvent2(),
                      addEvent3(),
                      addEvent4(),
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

/*Widget addEvent() {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F2),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                  child: Text(
                    "EVENT NAME 1",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Color(0xFF720972), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 12.0, bottom: 8.0, right: 12.0),
                  child: Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 12.0, bottom: 12.0, right: 12.0),
                  child: Text(
                    "Read More",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Color(0xFF0091DE), fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}*/
Widget addEvent(context) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F2),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                  child: Text(
                    "PEER MENTORSHIP",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF720972), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 8.0, right: 12.0),
                  child: Text(
                    "A 30 hour peer mentorship programme on the Topic: Blender and 3-D Animation was held virtually in the college from 5th August 2021- 31st August 2021. The students learnt the basics of Blender, which included all its tools, functionalities, and the various shortcut keys used in the software. Rigourous work started from the second day of the workshop, where the first 3-D project made was an astronaut. With the constant...",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 12.0, right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Event1()),
                      );
                    },
                    child: Text(
                      "Read More",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color(0xFF0091DE),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget addEvent1(context) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F2),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                  child: Text(
                    "UN-LOCK BENEFITS OF LINKEDIN",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF720972), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 8.0, right: 12.0),
                  child: Text(
                    'When it comes to utilizing social network as a tool to advance your professional career, LinkedIn is at the top of the list and incomparable to any other social network when it comes to business. With this notion, on 4th September 2021, ...',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 12.0, right: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Event2()),
                      );
                    },
                    child: Text(
                      "Read More",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Color(0xFF0091DE),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget addEvent2() {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F2),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                  child: Text(
                    "FINANCIAL WELLNESS",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF720972), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 8.0, right: 12.0),
                  child: Text(
                    'The Placement and Internship Cell, Mata Sundri College for Women, hosted an interactive session on “Financial Wellness” by one of the prestigious members of BIAP, Ms. Daksha Gogia...',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 12.0, right: 12.0),
                  child: Text(
                    "Read More",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF0091DE),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget addEvent3() {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F2),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                  child: Text(
                    "SUCCESS THROUGH TEAMWORK",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF720972), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 8.0, right: 12.0),
                  child: Text(
                    "the introduction speech by our NCC Caretaker Ms. Gurvinder Kaur and Ms. Ishleen Kaur. After this ma’am invited our Principal Prof. Dr. Harpreet Kaur to throw light on commencements of the program and further welcomed Col. Dr. M.P. Singh...",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 12.0, right: 12.0),
                  child: Text(
                    "Read More",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF0091DE),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget addEvent4() {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F2F2),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, left: 12.0, bottom: 4.0, right: 12.0),
                  child: Text(
                    "REBOOT",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF720972), fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 8.0, right: 12.0),
                  child: Text(
                    "The Annual Technical Fest of Department of Computer Science, in which many different competitions are being organized every year to give students some break from their monotonous schedule...",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(color: Colors.black87),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 12.0, bottom: 12.0, right: 12.0),
                  child: Text(
                    "Read More",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: Color(0xFF0091DE),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//implementing search functionality

class Search extends SearchDelegate<String> {
  String got = "";
  final eventsinclg = [
    "Peer mentorship programme",
    "Un-lock benefits of LinkedIn",
    "Financial wellness",
    "Success through teamwork",
    "Reboot",
    "Webinar on mental health",
    "TEDx event",
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
    recentsrch[0] = recentsrch[1];
    recentsrch[1] = got;
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
