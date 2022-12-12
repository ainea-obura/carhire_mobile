import 'package:mobile/models/api_response.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController fnameController = TextEditingController(),
      lnameController = TextEditingController(),
      phoneController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  void _registerUser() async {
    ApiResponse response = await register(
        fnameController.text,
        lnameController.text,
        phoneController.text,
        emailController.text,
        passwordController.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Save and redirect to home
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),*/
      body: Container(
          color: Colors.teal,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 4.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 20, right: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextFormField(
                                    style: const TextStyle(color: Color(0xFF000000)),
                                    cursorColor: const Color(0xFF9b9b9b),
                                    controller: fnameController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      hintText: "First Name",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  validator: (firstname) {
                                    if (firstname != null && firstname.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                  },
                                ),
                                TextFormField(
                                    style: const TextStyle(color: Color(0xFF000000)),
                                    cursorColor: const Color(0xFF9b9b9b),
                                    controller: lnameController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  validator: (lastname) {
                                    if (lastname != null && lastname.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                  },
                                ),
                                TextFormField(
                                    style: const TextStyle(color: Color(0xFF000000)),
                                    cursorColor: const Color(0xFF9b9b9b),
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Phone",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  validator: (phonenumber) {
                                    if (phonenumber != null && phonenumber.isEmpty) {
                                      return 'Please enter phone number';
                                    }
                                  },
                                ),

                                TextFormField(
                                    style: const TextStyle(color: Color(0xFF000000)),
                                    cursorColor: const Color(0xFF9b9b9b),
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  validator: (emailValue) {
                                    if (emailValue != null && emailValue.isEmpty) {
                                      return 'Please enter email';
                                    }
                                  },
                                ),
                                TextFormField(
                                    style: const TextStyle(color: Color(0xFF000000)),
                                    cursorColor: const Color(0xFF9b9b9b),
                                    controller: passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    validator: (passwordValue){
                                      if (passwordValue != null && passwordValue.isEmpty){
                                        return 'Please enter your password';
                                      }
                                    },
                                ),
                                TextFormField(
                                    style: const TextStyle(color: Color(0xFF000000)),
                                    cursorColor: const Color(0xFF9b9b9b),
                                    controller: passwordConfirmController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        color: Colors.grey,
                                      ),
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(
                                          color: Color(0xFF9b9b9b),
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    validator: (val) =>
                                        val != passwordController.text
                                            ? 'Confirm password does not match'
                                            : null,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                loading
                                    ? Center(child: CircularProgressIndicator())
                                    : kTextButton(
                                        'Register',
                                        () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              loading = !loading;
                                              _registerUser();
                                            });
                                          }
                                        },
                                      ),
                                SizedBox(
                                  height: 20,
                                ),
                                kLoginRegisterHint(
                                    'Already have an account? ', 'Login', () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => Login()),
                                      (route) => false);
                                })
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
