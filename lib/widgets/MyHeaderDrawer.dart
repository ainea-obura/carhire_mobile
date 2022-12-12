
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  String? name;
  String? lName;
  String? userEmail;
  @override
  void initState(){
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var fname = pref.getString('fname');
    var lname = pref.getString('lname');
    var email = pref.getString('email');
    setState(() {
      name = fname;
      lName = lname;
      userEmail = email;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF00A368),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user2.png'),
              ),
            ),
          ),

          Text(
            '$name $lName',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            '$userEmail',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

