import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_field_validator/form_field_validator.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'tabsPage.dart';
import 'sideMenu.dart';

class RaiseIssue extends StatefulWidget {
  _RaiseIssueState createState() => _RaiseIssueState();
}

class _RaiseIssueState extends State<RaiseIssue> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      print("validate");
    } else {
      print("Not Validate");
    }
  }

  String? validatepass(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Raise An Issue',
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => tabsPage(selectedIndex: 0)),
                  );
                  //Navigator.pop(context);
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'btn11',
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
        drawer: SideMenu(),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: AssetImage('images/boat.jpg')),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 15.0),
                padding: EdgeInsets.only(left: 25.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Grievance",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        )))),
            Container(
                margin: EdgeInsets.symmetric(vertical: 80.0, horizontal: 15.0),
                padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Redressal",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      textAlign: TextAlign.left,
                    ))),
          ]),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Fill Grievance Form to Raise an Issue",
                    style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(color: Colors.grey[800], letterSpacing: .2),
                    ),
                    textAlign: TextAlign.left,
                  ))),
          SizedBox(
            height: 1.5,
          ),
          Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Fill all the mandatory fields marked with '*'",
                      style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(color: Colors.red, letterSpacing: .2),
                      ),
                      textAlign: TextAlign.left))),
          Container(
              height: MediaQuery.of(context).size.height - 200.0,
              width: 500.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xFFF0F0F0),
              ),
              margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Form(
                  //autovalidate: false,
                  key: formKey,
                  child: Column(children: <Widget>[
                    Container(
                        child: Row(children: <Widget>[
                      Expanded(
                          child: TextFormField(
                              validator: validatepass,
                              decoration: InputDecoration(
                                  labelText: "* First Name",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: "Last Name",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))))),
                    ])),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                        child: TextFormField(
                            validator: validatepass,
                            decoration: InputDecoration(
                                labelText: "* Enter your Phone no.",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                        child: TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                              EmailValidator(
                                  errorText: "Please enter valid email ID")
                            ]),
                            decoration: InputDecoration(
                                labelText: "* Enter your Email id",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                        child: TextFormField(
                            validator: validatepass,
                            decoration: InputDecoration(
                                labelText: "*Subject for issue",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                        child: TextField(
                            maxLines: 10,
                            decoration: InputDecoration(
                                labelText: "Write your issue",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(20.0))))),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            //padding: EdgeInsets.all(2),
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 40),
                            child: ElevatedButton(
                              onPressed: () {},
                              // color: Color(0xFFFFBA15),
                              // shape: RoundedRectangleBorder(
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(10.0)),
                              // ),
                              child: Text(
                                "UPLOAD\nDOCUMENTS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            //padding: EdgeInsets.all(2),
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: ElevatedButton(
                              onPressed: validate,
                              // color: Color(0XFF04C300),
                              // shape: RoundedRectangleBorder(
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(10.0)),
                              // ),
                              child: Text(
                                "SUBMIT",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ]))),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.purple[800],
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'matasundricollege.du@gmail.com',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  width: 7.0,
                ),
              ],
            ),
          ),
        ]))));
  }
}
