import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
//import 'package:flutter/rendering.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'sideMenu.dart';
import 'tabsPage.dart';

class Publish extends StatefulWidget {
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  int? _value1 = 0, _value2 = 0;
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
        centerTitle: false,
        title: Text(
          'Publish Job and Internship Opportunity',
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
      drawer: SideMenu(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn10',
        onPressed: () {},
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('images/chatbot.jpg'), fit: BoxFit.fill),
            // child: Image(image: AssetImage('images/boat.jpg'))
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Column(children: [
        SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: AssetImage('images/boat.jpg')),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Fill this Form to Publish an Opportunity. ",
                  style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(color: Colors.grey[800], letterSpacing: .2),
                  ),
                  textAlign: TextAlign.left,
                ))),
        SizedBox(
          height: 2.0,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Color(0xFFF0F0F0),
            ),
            height: 720.0,
            width: 500.0,
            //decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0))),
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Form(
                //autovalidate: false,
                key: formKey,
                child: Column(children: <Widget>[
                  Container(
                      height: 55,
                      child: Row(children: <Widget>[
                        Expanded(
                            child: TextFormField(
                                validator: validatepass,
                                decoration: InputDecoration(
                                    labelText: "*First Name",
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
                    height: 20.0,
                  ),
                  Expanded(
                      child: DropdownButtonFormField(
                    validator: (value) => value == 0 ? "Required" : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    //hint: Text("*Select your Department"),
                    elevation: 4,
                    isExpanded: true,
                    value: _value1,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "*Select your Role",
                        ),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Alumni"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Admin"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Student"),
                        value: 3,
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _value1 = value;
                      });
                    },
                  )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      height: 55,
                      child: Row(children: <Widget>[
                        Expanded(
                            child: TextFormField(
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "Required"),
                                  EmailValidator(
                                      errorText: "Please enter valid email ID")
                                ]),
                                decoration: InputDecoration(
                                    labelText: "*Enter your Email id",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))))),
                      ])),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      height: 55,
                      child: Row(children: <Widget>[
                        Expanded(
                            child: TextFormField(
                                validator: validatepass,
                                decoration: InputDecoration(
                                    labelText: "*Enter your Phone no",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))))),
                      ])),
                  SizedBox(
                    height: 20.0,
                  ),
                  /*Container(
                                  height: 55,
                                  child: Row(children: <Widget>[*/
                  Expanded(
                    child: DropdownButtonFormField(
                      validator: (value) => value == 0 ? "Required" : null,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                      //hint: Text("*Select your Department"),
                      elevation: 4,
                      isExpanded: true,
                      value: _value2,

                      items: [
                        DropdownMenuItem(
                          child: Text(
                            "*Select your Department",
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text("Commerce"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Economics"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("English"),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Text("Hindi"),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Text("Mathematics"),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Text("Philosophy"),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Text("Political Science"),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: Text("Punjabi"),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: Text("Statistics"),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: Text("Computer Science"),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: Text("Elementary Education"),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: Text("Environmental Science"),
                          value: 12,
                        ),
                        DropdownMenuItem(
                          child: Text("History"),
                          value: 13,
                        ),
                        DropdownMenuItem(
                          child: Text("Music"),
                          value: 14,
                        ),
                        DropdownMenuItem(
                          child: Text("Physical Education and Sports Sciences"),
                          value: 15,
                        ),
                        DropdownMenuItem(
                          child: Text("Psychology"),
                          value: 16,
                        ),
                        DropdownMenuItem(
                          child: Text("Sanskrit"),
                          value: 17,
                        ),
                        DropdownMenuItem(
                          child: Text("Urdu"),
                          value: 18,
                        ),
                      ],
                      onChanged: (int? value) {
                        setState(() {
                          _value2 = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                      child: DropdownButtonFormField(
                    validator: (value) => value == 0 ? "Required" : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                    //hint: Text("*Select your Department"),
                    elevation: 4,
                    isExpanded: true,
                    value: _value1,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "*Type of Opportunity",
                        ),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Internship"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Placement"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Internship with PPO"),
                        value: 3,
                      ),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _value1 = value;
                      });
                    },
                  )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      height: 100,
                      child: Row(children: <Widget>[
                        Expanded(
                            child: TextField(
                                maxLines: 10,
                                decoration: InputDecoration(
                                    labelText: "Eligibility Criteria",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0))))),
                      ])),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Only 1 document can be uploaded for job profile",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.grey[800], letterSpacing: .2),
                            ),
                            textAlign: TextAlign.left,
                          ))),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      height: 50,
                      //padding: EdgeInsets.symmetric(horizontal: 15.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: Row(
                        //Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            // color: Color(0xFFFFBA15),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(10.0)),
                            // ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Upload Job Profile",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Padding(
                            //padding: EdgeInsets.all(2),
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 15),
                            child: ElevatedButton(
                              onPressed: () => [
                                //validate(),
                              ],
                              // color: Color(0XFF04C300),
                              // shape: RoundedRectangleBorder(
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(10.0)),
                              // ),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  //),
                  SizedBox(
                    height: 10.0,
                  ),
                ]))),
      ]))),
    );
  }
}
