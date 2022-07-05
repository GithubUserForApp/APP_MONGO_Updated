import 'package:flutter/material.dart';
import 'package:mscapp/signup.dart';
import 'tabsPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'authservice.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  @override
  AdSignIn createState() => AdSignIn();//AdSignIn(),
  }

class AdSignIn extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
    var name, password, token;
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => tabsPage(selectedIndex: 0)),
                );
              },
            );
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 30, 20),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset('images/msc_logo.png', height: 70, width: 70),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign In',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  width: 63,
                  height: 7,
                  margin: EdgeInsets.only(right: 275),
                  decoration: BoxDecoration(
                    color: Color(0xFF720792),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
            child: Text(
              'Please sign in to your Account to\ncontinue to your app',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                height: 1.7,
                fontFamily: 'Lato',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5),
            child: Text(
              '(Only Admins are alowed to Login)',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFFFE0505),
                fontFamily: 'Lato',
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 20, 15),
                  child: SizedBox(
                    width: 270,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Username cannot be empty';
                    } else {
                      name = val;
                    }
                    return null;
                  },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF720972),
                        ),
                        hintText: "Username",
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF6C6C6C),
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 20, 20, 40),
                  child: SizedBox(
                    width: 270,
                    child: TextFormField(
                      obscureText: true,
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (val.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    } else {
                      password = val;
                    }
                    return null;
                  },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFF720972),
                        ),
                        hintText: "Password",
                      ),
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF6C6C6C),
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              //padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 15.0),
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 50),
              child: ElevatedButton(
                onPressed: () {

                  print("Name == $name, Password == $password");
                    AuthService().login(name, password).then((val) {
                      print(val);
                      if (val.data['success'] != null) {
                        token = val.data!['token'];
                        Fluttertoast.showToast(
                          msg: 'Authenticated',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.white,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    });
                    if (formKey.currentState!.validate()) {
                      debugPrint('All validations passed');
                    }
                },
                // color: Color(0xFF720792),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.all(Radius.circular(50.0)),
                // ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          /*Container(
            child: Text(
              'Don’t have an account?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 15,
                height: 2,
              ),
            ),
          ),*/
          Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text("Don't have an account?",
                       textAlign: TextAlign.center,
                      style: TextStyle(
                color: Color(0xFF6C6C6C),
                fontSize: 15,
                height: 2,
              ),
                          ))),
          Container(
            child: Text(
              'CONTACT ADMIN OFFICE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0091DE),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btn1',
        onPressed: () {
         //Navigator.pushNamed(context, 'register');
        },
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
    );
  }
}
