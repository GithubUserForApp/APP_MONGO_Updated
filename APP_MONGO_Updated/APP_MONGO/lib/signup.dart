import 'package:flutter/material.dart';

class MySignUpPage extends StatefulWidget {
  @override
   SignupForm createState() => SignupForm();
  //SignupForm createState() {
   // return SignupForm();
  //}
}

class SignupForm extends State<MySignUpPage> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text('Registration'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/signupimg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(2),
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Username cannot be empty';
                    } else if (val.length < 3) {
                      return 'Username must be at least 3 charcters long.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      labelText: 'Username',
                      hintText: 'Your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (val.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      labelText: 'Password',
                      hintText: 'Your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: confirmpasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (val != passwordController.value.text) {
                      return 'Passwords do not match!';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(2),
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? val) {
                    if (val == null || val.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      filled: true, //<-- SEE HERE
                      fillColor: Colors.white,
                      labelText: 'Email',
                      hintText: 'Your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      debugPrint('All validations passed');
                    }
                    style:
                    ElevatedButton.styleFrom(
                      primary: Colors.orange, // Background color
                      onPrimary: Colors.black, //Text Color (Foreground color)
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(35)),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'admin_login');
                      },
                      child: Text("Login",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Colors.orange,
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}
