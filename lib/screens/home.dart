//import 'package:mobile/screens/profile.dart';
import 'dart:convert';
import 'package:mobile/screens/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:mobile/widgets/BrandsWidget.dart';
import '../widgets/CarWidget.dart';
import 'login.dart';
import '../widgets/MyHeaderDrawer.dart';
import '../screens/my_hires.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  String? fName;

  @override
  void initState(){
    _loadUserData();
    super.initState();
  }
  _loadUserData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var firstName = pref.getString('fname');
    setState(() {
      fName = firstName;
    });
    //print(lname);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of the device
    var brightness = MediaQuery.of(context).platformBrightness;

    return Scaffold(
      backgroundColor: Color(0xFF00A368),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                //drawerList();
                ListTile(
                  leading: Icon(
                    Icons.car_rental,
                  ),
                  title: const Text('My Hires'),
                  onTap: () {
                    //Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHires())
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.train,
                  ),
                  title: const Text('Contact us'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Contact())
                    );
                  },
                ),
                const AboutListTile( // <-- SEE HERE
                  icon: Icon(
                    Icons.info,
                  ),
                  child: Text('About us'),
                  applicationIcon: Icon(
                    Icons.local_play,
                  ),
                  applicationName: 'Car Hire',
                  applicationVersion: '1.0',
                  applicationLegalese: '© 2022 Car Hire',
                  aboutBoxChildren: [
                    ///Content goes here...
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF00A368),
        //title: Text('Carhire'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => Login()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //custom appbar
              /*Container(
                padding: EdgeInsets.only(right: 20, left: 15, top: 10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF00A368),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 2,
                            ),
                          ]),
                      child: IconButton(
                        icon: const Icon(
                          Icons.exit_to_app,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          logout().then((value) => {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                    (route) => false)
                              });
                        },
                      ),
                    )
                  ],
                ),
              ),*/

              //Welcome Text
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      "Welcome $fName,",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Which car do you want to hire?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),

              //search widget
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "search car ", border: InputBorder.none),
                      ),
                    ),
                    const Spacer(),
                    //Icon(Icons.filter_list),
                  ],
                ),
              ),

              //cars widgets
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BrandsWidget(),
                    //PopularCarsWidget(),
                    CarsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
